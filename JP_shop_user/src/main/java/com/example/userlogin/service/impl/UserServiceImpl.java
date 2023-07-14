package com.example.userlogin.service.impl;

import com.example.userlogin.dao.UserDao;
import com.example.userlogin.dto.UserLoginRequest;
import com.example.userlogin.dto.UserRegisterRequest;
import com.example.userlogin.model.User;
import com.example.userlogin.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.util.DigestUtils;
import org.springframework.web.server.ResponseStatusException;

@Component
public class UserServiceImpl implements UserService {

    private final static Logger log = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserDao userDao;

    @Override
    public User getUserById(Integer userId) {

        return userDao.getUserById(userId);
    }

    @Override
    public Integer register(UserRegisterRequest userRegisterRequest) {
        //檢查手機號碼是否已被註冊
        User user = userDao.getUserByPhone(userRegisterRequest.getUserPhone());

        if(user != null){
            log.warn("該手機號碼 {} 已被註冊",userRegisterRequest.getUserPhone());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
        //使用MD5生成密碼的雜湊值
        String hashedPassword = DigestUtils.md5DigestAsHex(userRegisterRequest.getUserPassword().getBytes());
        userRegisterRequest.setUserPassword(hashedPassword);

        //創建帳號
        return userDao.createUser(userRegisterRequest);
    }

    @Override
    public User login(UserLoginRequest userLoginRequest) {
        User user = userDao.getUserByPhone(userLoginRequest.getUserPhone());

        //檢查user是否存在
        if(user == null) {
            log.warn("該手機號碼: {} 尚未被註冊過",userLoginRequest.getUserPhone());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }

        //使用MD5生成密碼的雜湊值
        String hashedPassword = DigestUtils.md5DigestAsHex(userLoginRequest.getUserPassword().getBytes());

        //比較密碼是否正確
        if(user.getUserPassword().equals(hashedPassword)) {
            return user;
        }else{
            log.warn("手機號碼: {}的密碼不正確",userLoginRequest.getUserPhone());
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }
}
