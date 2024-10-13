package com.sky.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long id;

    //姓名
    private String name;

    //用户名
    private String username;

    //密码
    private String password;

    //性别 0 女 1 男
    private String sex;

    //身份证号
    private String idNumber;

    //注册时间
    private LocalDateTime createTime;
}
