package com.sky.api.client.fallback;

import com.sky.api.client.ShoppingCartClient;
import com.sky.api.dto.Result;
import com.sky.api.dto.ShoppingCart;
import com.sky.exception.ShoppingCartBusinessException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cloud.openfeign.FallbackFactory;

import java.util.List;

@Slf4j
public class ShoppingCartClientFallBack implements FallbackFactory<ShoppingCartClient> {
    @Override
    public ShoppingCartClient create(Throwable cause){
        return new ShoppingCartClient() {
            @Override
            public Result<List<ShoppingCart>> list() {
                return null;
            }

            @Override
            public Result insertBatch(List<ShoppingCart> list) {
                return null;
            }

            @Override
            public Result clean() {
               // 清空购物车业务进行失败时，需要触发事务回滚，抛出异常。
               throw new ShoppingCartBusinessException("清空购物车失败");
            }
        };
    }
}
