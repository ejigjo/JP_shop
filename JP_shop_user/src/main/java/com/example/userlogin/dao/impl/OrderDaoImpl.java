package com.example.userlogin.dao.impl;

import com.example.userlogin.dao.OrderDao;
import com.example.userlogin.model.Order;
import com.example.userlogin.rowmapper.OrderRowMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;
    @Override
    public List<Order> getOrderbyId(Integer orderId) {
        String sql = "SELECT `od_id`,`od_status`,`od_name`,`od_phone`,`od_address`,`od_time`,`od_total`" +
                "FROM `order` WHERE od_id = :orderId";

        Map<String, Object> map = new HashMap<>();
        map.put("orderId", orderId);

        List<Order> orderList =namedParameterJdbcTemplate.query(sql,map, new OrderRowMapper());

        return orderList;
    }
}
