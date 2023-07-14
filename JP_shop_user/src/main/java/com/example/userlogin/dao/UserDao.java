package com.example.userlogin.dao;

import com.example.userlogin.dto.UserRegisterRequest;
import com.example.userlogin.model.User;

public interface UserDao {
    User getUserById(Integer userId);
    User getUserByPhone(String userPhone);
    Integer createUser(UserRegisterRequest userRegisterRequest);

}
