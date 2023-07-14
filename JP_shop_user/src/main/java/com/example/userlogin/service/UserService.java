package com.example.userlogin.service;

import com.example.userlogin.dto.UserLoginRequest;
import com.example.userlogin.dto.UserRegisterRequest;
import com.example.userlogin.model.User;

public interface UserService {
    User getUserById(Integer userId);
    Integer register(UserRegisterRequest userRegisterRequest);
    User login(UserLoginRequest userLoginRequest);
}
