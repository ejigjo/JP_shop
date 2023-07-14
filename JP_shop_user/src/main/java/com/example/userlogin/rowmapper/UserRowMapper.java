package com.example.userlogin.rowmapper;

import com.example.userlogin.model.User;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRowMapper implements RowMapper<User> {
    @Override
    public User mapRow(ResultSet resultSet, int i) throws SQLException {
        User user = new User();
        user.setUserId(resultSet.getInt("user_id"));
        user.setUserName(resultSet.getString("user_name"));
        user.setUserAccount(resultSet.getString("user_account"));
        user.setUserPassword(resultSet.getString("user_password"));
        user.setUserPhone(resultSet.getString("user_phone"));

        return user;
    }
}
