package com.sky.api.client.user;

import com.sky.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Map;

//@Mapper
public interface UserMapper {
    /**
     * 根据用户名查询员工
     * @param username
     * @return
     */
    @Select("select * from user where username = #{username}")
    User getByUsername(String username);

    /**
     * 插入数据
     * @param user
     */
    void insert(User user);

    @Select("select * from user where id = #{id}")
    User getById(Long userId);

    /**
     * 根据动态条件统计用户数量
     * @param map
     * @return
     */
    Integer countByMap(Map map);
}
