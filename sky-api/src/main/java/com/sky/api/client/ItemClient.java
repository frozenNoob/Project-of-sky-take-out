package com.sky.api.client;

import com.sky.api.config.DefaultFeignConfig;
import com.sky.entity.Dish;
import com.sky.entity.Setmeal;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(value = "item-service", path = "/user", configuration = DefaultFeignConfig.class)
public interface ItemClient {
    @GetMapping("/dish/{id}")
    Dish getDishById(@PathVariable("id") Long dishId);

    @GetMapping("/setmeal/{id}")
    Setmeal getSetmealById(@PathVariable("id") Long setmealId);

}
