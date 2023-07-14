package com.example.mapper;

import com.example.pojo.Emp;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface EmpMapper {

    @Select("select * from pojo.emp where username = #{username} and password = #{password}")
    Emp getByUserNameAndPassword(Emp emp);
}
