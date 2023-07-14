package com.example.exception;

import com.example.pojo.Result;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

// 全局異常處理器
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class) //捕獲所有異常
    public Result exception(Exception ex){
        ex.printStackTrace();
        return Result.error("操作失敗");
    }
}
