package com.example;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@SpringBootTest
class PojoProjectApplicationTests {
    // 測試生成JWT令牌
    @Test
    public void testGenJwt() {
        Map<String, Object> claims = new HashMap<>();
        claims.put("id",1);
        claims.put("username","admin");

        String Jwt = Jwts.builder()
                .signWith(SignatureAlgorithm.HS256, "pojo") //指定簽名算法
                .setClaims(claims) // 自定義內容:兩個鍵值，這裡使用id與對象，對象由帳號與密碼組成
                .setExpiration(new Date(System.currentTimeMillis() + 3600 * 1000)) // 設置令牌有效期限: 當前時間毫秒值(Long) + 1 hr
                .compact();// 最終取得Jwt令牌
        // 打印Jwt看看
        System.out.println(Jwt);
    }

    // 解析Jwt令牌
    @Test
    public void testParseJet(){
        Claims claims = Jwts.parser()
                .setSigningKey("pojo")
                .parseClaimsJws("eyJhbGciOiJIUzI1NiJ9.eyJpZCI6MSwiZXhwIjoxNjg4ODE4Mjk4LCJ1c2VybmFtZSI6ImFkbWluIn0.5_o61sGu11kIMzrio8o0lcVRf63V5wRIa6DZp7K8Kmc")
                .getBody();
        System.out.println(claims);
    }



}
