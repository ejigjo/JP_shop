package com.example.reggie.common;

/**
 * 自定義業務異常
 */
public class CustomException extends RuntimeException {
    public CustomException(String message){
        super(message);
    }
}
