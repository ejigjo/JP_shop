package com.example.userlogin.dto;

import jakarta.validation.constraints.NotBlank;

public class UserLoginRequest {
    @NotBlank
    private String userPassword;
    @NotBlank
    private String userPhone;

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }
}
