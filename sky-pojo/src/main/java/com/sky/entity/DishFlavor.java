package com.sky.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * 菜品口味
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class DishFlavor implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;
    //菜品id
    private Long dishId;

    //口味名称
    private String name;

    //口味数据list,注意这里是dish_flavor表中的value，比如'["无糖","少糖","半糖","多糖","全糖"]',
    //每种菜有不同的口味，每种口味可能有多种菜，多对多关系！！这里建表不是多对多关系是因为直接在前端存储了口味的数据
    //不然会出现异常，比如删除了某些菜品后，一种口味的数据就在数据库中完全消失了，但是因为前端对该口味数据进行了存储，所以不用担心。
    // 当然我建议还是分开为好，不然口味数据是在前端存储的严格来说不是很前后端分离，数据应该存储在数据库中，并且还是由后端来调用为好。
    private String value;

}
