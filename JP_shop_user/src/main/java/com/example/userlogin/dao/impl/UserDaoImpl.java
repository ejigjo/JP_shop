package com.example.userlogin.dao.impl;

import com.example.userlogin.dao.UserDao;
import com.example.userlogin.dto.UserRegisterRequest;
import com.example.userlogin.model.User;
import com.example.userlogin.rowmapper.UserRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class UserDaoImpl implements UserDao {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    @Override
    public User getUserById(Integer userId) {
        String sql = "SELECT `user_id`,`user_name`,`user_account`,`user_password`,`user_phone`" +
                "FROM user where user_id = :userId";

        Map<String, Object> map = new HashMap<>();
        map.put("userId", userId);

        List<User> userList = namedParameterJdbcTemplate.query(sql,map,new UserRowMapper());

        if(userList.size() > 0){
            return userList.get(0);
        }else{
            return null;
        }
    }

    @Override
    public User getUserByPhone(String userPhone) {
        String sql = "SELECT `user_id`,`user_name`,`user_account`,`user_password`,`user_phone` " +
                "FROM user where user_phone = :userPhone";
        Map<String, Object> map = new HashMap<>();
        map.put("userPhone", userPhone);

        List<User> userList = namedParameterJdbcTemplate.query(sql,map, new UserRowMapper());

        if(userList.size() > 0){
            return userList.get(0);
        }else{
            return null;
        }
    }

    @Override
    public Integer createUser(UserRegisterRequest userRegisterRequest) {
        String sql = "INSERT INTO user(user_name,user_account,user_password,user_phone) " +
                "VALUES(:userName,:userAccount,:userPassword,:userPhone)";

        Map<String,Object> map = new HashMap<>();
        map.put("userName",userRegisterRequest.getUserName());
        map.put("userAccount",userRegisterRequest.getUserAccount());
        map.put("userPassword",userRegisterRequest.getUserPassword());
        map.put("userPhone",userRegisterRequest.getUserPhone());

        KeyHolder keyHolder = new GeneratedKeyHolder();

        namedParameterJdbcTemplate.update(sql, new MapSqlParameterSource(map),keyHolder);

        int userId = keyHolder.getKey().intValue();

        return userId;
    }
}
