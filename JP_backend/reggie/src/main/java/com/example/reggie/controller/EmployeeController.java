package com.example.reggie.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.reggie.common.R;
import com.example.reggie.entity.Employee;
import com.example.reggie.service.impl.EmployeeServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.time.LocalDateTime;

@Slf4j
@RestController
@RequestMapping("/employee")
public class EmployeeController {
    @Autowired
    private EmployeeServiceImpl employeeService;

    /**
     * 員工登錄
     */
    @PostMapping("/login")
    public R<Employee> login(HttpServletRequest request, @RequestBody Employee employee) {
        // 1. md5 加密密碼
        String password = employee.getPassword();
        password = DigestUtils.md5DigestAsHex(password.getBytes());

        // 2. 根據用戶名查詢數據庫
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Employee::getUsername, employee.getUsername());
        Employee emp = employeeService.getOne(queryWrapper);// 數據庫已經做限制username是唯一值，因此用getOne查找
        if (emp == null) {
            return R.error("登錄失敗");
        }

        // 3. 對比對應的密碼是否吻合
        if (!emp.getPassword().equals(password)) {
            return R.error("登錄失敗");
        }

        // 4. 查看員工狀態是否為禁用
        if (emp.getStatus() == 0) {
            return R.error("該帳戶已經被禁用");
        }

        // 5. 將員工id放入Session並返回成功結果
        request.getSession().setAttribute("employee", emp.getId());
        return R.success(emp);
    }

    /**
     * 員工退出
     */
    @PostMapping("/logout")
    public R<String> logout(HttpServletRequest request) {
        // 清理掉Session中儲存的信息
        request.getSession().removeAttribute("employee");
        // 返回成功退出信息
        return R.success("退出成功");
    }

    /**
     * 員工新增
     */
    @PostMapping
    public R<String> save(HttpServletRequest request, @RequestBody Employee employee) {
        log.info("新增員工，員工信息:{}", employee.toString());
        // 設置初始密碼並進行加密
        employee.setPassword(DigestUtils.md5DigestAsHex("123456".getBytes()));

        //employee.setCreateTime(LocalDateTime.now());
        //employee.setUpdateTime(LocalDateTime.now());

        // 獲取當前登錄用戶的id
        //Long empId = (Long) request.getSession().getAttribute("employee");

        //employee.setCreateUser(empId);
        //employee.setUpdateUser(empId);

        // 將id存入
        employeeService.save(employee);
        return R.success("新增員工成功");
    }

    /**
     * 員工信息分頁+條件查詢
     * 接收頁面查詢請求 路徑: /employee/page
     * 範型是MP內建的Page對象，因為響應要求有record and total
     */
    @GetMapping("/page")
    public R<Page> page(int page, int pageSize, String name) {
        // 確認page pageSize有無成功接收
        log.info("page = {}, pageSize = {}, name = {}", page, pageSize, name);
        // 創建分頁構造器
        Page pageInfo = new Page(page,pageSize);
        // 創建條件構造器
        LambdaQueryWrapper<Employee> queryWrapper = new LambdaQueryWrapper<>();
        // 添加上過濾條件: 條件是頁面傳來的員工姓名->模糊查詢
        queryWrapper.like(StringUtils.isNotEmpty(name), Employee::getName, name);
        // 添加排序
        queryWrapper.orderByDesc(Employee::getUpdateTime);
        // 執行查詢
        employeeService.page(pageInfo,queryWrapper);
        return R.success(pageInfo);
    }

    /** 員工啟用與禁用
     *  頁面發出禁用員工帳號請求，本質上是update操作，將資料庫的state修改為0
     *  因此可以將他與修改請求相連合
     */
    @PutMapping
    public R<String> update(HttpServletRequest request, @RequestBody Employee employee) {
        log.info(employee.toString());

        long id = Thread.currentThread().getId();
        log.info("線程id:{}", id);

        // 獲取修改者的id
        Long empId = (Long) request.getSession().getAttribute("employee");

        // 設置更新時間與修改者ID
        employee.setUpdateTime(LocalDateTime.now());
        employee.setUpdateUser(empId);

        // 資料送往邏輯處理層
        employeeService.updateById(employee);
        return R.success("員工信息修改成功");
    }

    @GetMapping("/{id}")
    public R<Employee> getById(@PathVariable Long id){

        log.info("根據id查詢員工信息");

        Employee employee = employeeService.getById(id);

        if(employee != null){
            return R.success(employee);
        }
        return R.error("沒有查詢到員工信息");
    }
     /* 1. 點擊編輯後頁面跳轉到add.html，並在url中攜帶員工id參數
    // 2. 在add.html中獲取url中的參數
    // 3. 發送ajax，請求服務端，同時提交員工數據
    // 4. 服務端接收請求，根據id查詢員工信息，並以json形式響應給頁面
    // 5. 頁面透過vue進行數據綁定進行員工信息回顯
    // 6. 點擊保存，發送ajax，頁面中員工信息以json方式提交給服務端
    // 7. 服務端接收員工數據，進行處理，完成後給頁面響應
    // 8. 頁面接收響應後進行相應處理
    */
}
