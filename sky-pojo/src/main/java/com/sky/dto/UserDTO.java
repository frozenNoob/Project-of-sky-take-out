package com.sky.dto;

import lombok.Data;

@Data
public class UserDTO {
    private Long id;
    //用户名，即手机号
    private String username;

    private String name;

    private String sex;

    private String idNumber;
}
