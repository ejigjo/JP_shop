package com.example.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result {
    private Integer code;
    private String msg;
    private Object data;

    //增删改 成功響應
    public static Result success() {
        return new Result(1, "success", null);
    }

    //查詢 成功響應
    public static Result success(Object data) {
        return new Result(1, "success", data);
    }

    //失敗響應
    public static Result error(String msg) {
        return new Result(0, msg, null);
    }
}