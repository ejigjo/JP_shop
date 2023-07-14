package com.example.mapper;

import com.example.pojo.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper  // 目的：IOC控制反轉
public interface ProductMapper {
    // 原始版本
    /*
    //查詢總紀錄數total
    @Select("select count(*) from pojo.Product")
    public Long count();
    
    //查詢分頁內所有數據page
    @Select("select * from pojo.Product limit #{start},#{pageSize}")
    public List<Product> page(Integer start, Integer pageSize);\
     */

    // 安裝pageHelper後的版本
    // 因為是動態sql，使用xml映射文本更加靈活 >> 在resource下配置com/example/mapper/ProductMapper.xml
    // @Select("select * from pojo.Product")
    // 條件分頁查詢
    public List<Product> list(String productName, String pdType, Integer begin, Integer end);

    // 批量刪除操作
    void delete(List<Integer> ids);

    // 新增商品，使用註解就好
    @Insert("insert into pojo.Product(product_name, description, image, price, category_id, pd_type) VALUES(#{productName}, #{description}, #{image}, #{price}, #{categoryId}, #{pdType}) ")
    void insert(Product product);

    // 根據id查詢商品1:查詢回顯
    @Select("select * from pojo.Product where id = #{id}")
    Product getById(Integer id);

    // 更新商品信息-動態sql
    void update(Product product);
}
