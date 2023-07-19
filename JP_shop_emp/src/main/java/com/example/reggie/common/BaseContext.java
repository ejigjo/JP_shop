package com.example.reggie.common;

/**
 * 基於LocalThread封裝工具類，用於保存與獲取當前登錄用戶的ID
 */
public class BaseContext {
    private static ThreadLocal<Long> threadLocal = new ThreadLocal<>();
    //設置id進去
    public static void setCurrentId(Long id){
        threadLocal.set(id);
    }
    //獲取當前線程(登錄者)的id
    public static Long getCurrentId(){
        return threadLocal.get();
    }
}