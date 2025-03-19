package com.sky.api.client;

import com.sky.api.client.fallback.ShoppingCartClientFallBack;
import com.sky.api.dto.Result;
import com.sky.api.dto.ShoppingCart;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

@Component
@FeignClient(value = "cart-service",
        path = "/user/shoppingCart",
        fallbackFactory = ShoppingCartClientFallBack.class)
public interface ShoppingCartClient {

    @GetMapping("/list")
    Result<List<ShoppingCart>> list();

    @PostMapping("/insertBatch")
    Result insertBatch(@RequestBody List<ShoppingCart> list);

    @DeleteMapping("/clean")
    Result clean();


}
