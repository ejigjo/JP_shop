package com.example.controller;

import com.example.pojo.Emp;
import com.example.pojo.Result;
import com.example.service.impl.EmpServiceImpl;
import com.example.utils.JwtUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
public class LoginController {
    @Autowired
    private EmpServiceImpl empService;
    // 會員登錄系統
    // 使用POST: @PostMapping
    // 路徑: /login
    // 發送JSON請求參數: @RequestBody 且形參用emp對象包裝
    @PostMapping("/login")
    public Result login(@RequestBody Emp emp){
        log.info("員工登錄:{}",emp);
        Emp e = empService.login(emp);
        // 如果e非空，代表請求的對象是存在的，所以響應的結果非空，則響應結果為Result.success

        // 登錄成功，則這裡調用工具類生成Jwt，並將其給予e
        if(e != null){
            // 生成令牌所需的參數，包含登錄者的id,username
            Map<String, Object> claims = new HashMap<>();
            claims.put("id",e.getId());
            claims.put("username",e.getUsername());
            claims.put("password",e.getPassword());

            String jwt = JwtUtils.generateJwt(claims);
            return Result.success(jwt);
        }
        // 登錄失敗，則返回錯誤信息
        return Result.error("用戶名或密碼錯誤");
    }
}
