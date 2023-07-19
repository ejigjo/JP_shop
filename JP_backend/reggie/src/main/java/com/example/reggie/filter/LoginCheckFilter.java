package com.example.reggie.filter;

import com.alibaba.fastjson.JSON;
import com.example.reggie.common.BaseContext;
import com.example.reggie.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 攔截未登錄者直接訪問網站的方式
// 1 創建自定義過濾器LoginCheckFilter攔截所有用戶
// 2 在啟動類加上註解@ServletComponantScan
// 3 完善過濾器的處理邏輯

@Slf4j
@WebFilter(filterName = "loginCheckFilter", urlPatterns = "/*")
public class LoginCheckFilter implements Filter {
    // 路徑比較，支持通配符，比較路徑是否符合數組
    public static final AntPathMatcher PATH_MATCHER = new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
                         FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // 1. 獲取本次請求的路徑
        String requestURI = request.getRequestURI();
        log.info("攔截到請求: {}", requestURI);
        // 定義不需要處理的請求:
        String[] urls = new String[]{
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**",
                "/common/**"
        };
        // 2. 判斷本次請求是否需要處理
        boolean check = check(urls, requestURI);

        // 3. 若不需處理，例如登錄或退出請求，則放行
        if(check){
            log.info("本次請求{}不需要處理", requestURI);
            filterChain.doFilter(request,response);
            return;
        }

        // 4. 判斷登錄狀態，若已經登錄，也放行
        Object userID = request.getSession().getAttribute("employee");
        if(userID != null){
            log.info("用戶已登錄, 用戶id為{}", userID);

            Long empId = (Long)request.getSession().getAttribute("employee");
            BaseContext.setCurrentId(empId);

            filterChain.doFilter(request,response);
            return;
        }

        // 5. 如果未登錄，則不放行，且返回未登錄結果
        /*
        只要後端響應未登錄數據(data=0 && msg=NOTLOGIN)，前端(request.js 45行)會做
        1. 刪除瀏覽器本地儲存用戶名單
        2. 彈回登錄界面的網址

        前端響應攔截器
        service.interceptors.response.use(res => {
        if (res.data.code === 0 && res.data.msg === 'NOTLOGIN') {// 返回登录页面
            console.log('---/backend/page/login/login.html---')
            localStorage.removeItem('userInfo')
            window.top.location.href = '../page/login/login.html'
        } else {
            return res.data
        }
        */
        log.info("用戶未登錄");
        response.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
        return;

    }

    // 定義一個方法，檢查本次請求是否放行的方法
    public boolean check(String[] urls, String requestURL){
        for(String url : urls){
            boolean match = PATH_MATCHER.match(url, requestURL);
            if(match){
                return true;
            }
        }
        return false;
    }

}
