package com.example.filter;

import com.alibaba.fastjson.JSONObject;
import com.example.pojo.Result;
import com.example.utils.JwtUtils;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;

import java.io.IOException;

@Slf4j
@WebFilter(urlPatterns = "/*")
public class LoginCheckFilter implements Filter {

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain) throws IOException, ServletException {
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;

        //1. 獲取請求路徑
        String url = req.getRequestURI().toString();
        log.info("請求的url:{}", url);

        //2. 判斷是否包含login,因為登錄操作本就沒有也不需要令牌，直接放行
        if (url.contains("login")) {
            log.info("登錄操作");
            // 放行的方法
            chain.doFilter(request, response);
            return;
        }

        //3. 獲取JWT <--已經登錄的請求者刷掉，剩下都應該要有JWT令牌 JWT位於Header
        String jwt = req.getHeader("token");

        //4. 判斷JWT是否存在,若不存在返回錯誤結果(未登錄)
        if (!StringUtils.hasLength(jwt)) {
            // 如果字符串沒有長度，等於null，則判斷沒有令牌
            log.info("請求頭的token為空，返回未登錄信息");
            Result error = Result.error("NOT_LOGIN");
            // 調用方法將返回值轉變為JSON
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return;
        }

        //5. 解析token,若解析失敗返回錯誤結果(未登錄)
        try {
            JwtUtils.parseJWT(jwt);
        } catch (Exception e) {
            e.printStackTrace();
            log.info("解析令牌失敗，返回未登錄信息");
            Result error = Result.error("NOT_LOGIN");
            // 調用方法將返回值轉變為JSON
            String notLogin = JSONObject.toJSONString(error);
            resp.getWriter().write(notLogin);
            return;
        }

        //6. 放行
        log.info("令牌合法，放行");
        chain.doFilter(request, response);
    }
}
