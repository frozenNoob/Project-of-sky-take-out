package com.sky.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;

/**
 * 顾客登录
 */
@Data
@ApiModel(description = "顾客登录时传递的数据模型")
public class UserLoginDTO implements Serializable {

    @ApiModelProperty("用户名（手机号）")
    private String username;

    @ApiModelProperty("密码")
    private String password;

}
