package com.example.userlogin.rowmapper;

import com.example.userlogin.model.Order;
import org.springframework.jdbc.core.RowMapper;

import java.sql.ResultSet;
import java.sql.SQLException;

public class OrderRowMapper implements RowMapper<Order> {

    @Override
    public Order mapRow(ResultSet resultSet, int i) throws SQLException {
        Order order = new Order();
        order.setOrderId(resultSet.getInt("od_id"));
        order.setOrderStatus(resultSet.getString("od_status"));
        order.setOrderName(resultSet.getString("od_name"));
        order.setOrderPhone(resultSet.getString("od_phone"));
        order.setOrderAddress(resultSet.getString("od_address"));
        order.setOrderTime(resultSet.getTimestamp("od_time"));
        order.setOrderTotal(resultSet.getInt("od_total"));

        return order;
    }
}
