package com.example.mapper;

import com.example.pojo.Category;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper // 目的：IOC控制反轉
public interface CategoryMapper {
    /**
     * 查詢全部分類項目
     * @return
     */
    // 需要注意，mapper層只需要接口就好，不用接口裏面的實現類
    // 因為查詢全部數據寫法相對單純，直接使用註解調用SQL語句，以連接查詢資料庫即可
    // 註解的方式查詢到資料庫內的數據後，會封裝到經由list()方法返回到Service再回到Controller...
    @Select("select * from pojo.Category")
    List<Category> list();

    /** 刪除分類項目根據id
     *
     */
    @Delete("delete from pojo.Category where id = #{id}")
    void deleteById(Integer id);

    /** 新增分類項目
     *
     */
    @Insert("insert into pojo.Category(name, create_time, update_time) VALUES (#{name},#{createTime},#{updateTime})")
    void insert(Category category);
}
