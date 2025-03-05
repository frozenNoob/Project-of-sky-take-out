package com.sky.controller;

import com.sky.constant.JwtClaimsConstant;
import com.sky.dto.UserDTO;
import com.sky.dto.UserLoginDTO;
import com.sky.entity.User;
import com.sky.properties.JwtProperties;
import com.sky.result.Result;
import com.sky.service.UserService;
import com.sky.utils.JwtUtil;
import com.sky.vo.UserLoginVO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@CrossOrigin
@RestController
@RequestMapping("/user/user")
@Api(tags = "C端用户相关接口")
@Slf4j
public class UserController {

    @Autowired
    private UserService userService;
    @Autowired
    private JwtProperties jwtProperties;

    /**
     * 顾客登录
     * @param userLoginDTO
     * @return
     */
    @PostMapping("/login")
    @ApiOperation("顾客登录")
    public Result<UserLoginVO> login(@RequestBody UserLoginDTO userLoginDTO){
        log.info("顾客登录,用户名：{}",userLoginDTO.getUsername());
        //顾客登录
        User user = userService.login(userLoginDTO);

        //为网页端的顾客用户生成jwt令牌
        Map<String, Object> claims = new HashMap<>();
        claims.put(JwtClaimsConstant.USER_ID,user.getId());
        String token = JwtUtil.createJWT(jwtProperties.getUserSecretKey(), jwtProperties.getUserTtl(), claims);

        UserLoginVO userLoginVO = UserLoginVO.builder()
                .id(user.getId())
                .token(token)
                .build();
        return Result.success(userLoginVO);
    }

    /**
     * 新增用户
     * @param userDTO
     * @return Result
     */
    @PostMapping
    @ApiOperation("新增用户")
    public Result save(@RequestBody UserDTO userDTO){
        log.info("新增用户：{}",userDTO);
        userService.save(userDTO);
        return Result.success();
    }
}
