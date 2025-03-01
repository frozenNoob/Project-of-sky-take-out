package com.sky.controller.admin;

import com.github.benmanes.caffeine.cache.Cache;
import com.sky.result.Result;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.web.bind.annotation.*;

@RestController("adminShopController")
@RequestMapping("/admin/shop")
@Api(tags = "店铺相关接口")
@Slf4j
public class ShopController {

    public static final String KEY = "SHOP_STATUS";

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;
    @Autowired
    private Cache<String, Object> caffeineCache;

    /**
     * 设置店铺的营业状态
     *
     * @param status
     * @return
     */
    @PutMapping("/{status}")
    @ApiOperation("设置店铺的营业状态")
    public Result setStatus(@PathVariable Integer status) {
        log.info("设置店铺的营业状态为：{}", status == 1 ? "营业中" : "打烊中");

        caffeineCache.put(KEY, status);
        redisTemplate.opsForValue().set(KEY, status);
        return Result.success();
    }

    /**
     * 获取店铺的营业状态
     *
     * @return
     */
    @GetMapping("/status")
    @ApiOperation("获取店铺的营业状态")
    public Result<Integer> getStatus() {
        Object o = caffeineCache.getIfPresent(KEY);
        Integer status;
        // 1、先从Caffeine缓存中获取
        if (o != null) {
            System.out.println("从Caffeine中查询到数据");
            status = (Integer) o;
            log.info("获取到店铺的营业状态为：{}", status == 1 ? "营业中" : "打烊中");
            return Result.success(status);
        }
        //2、如果Caffeine中不存在，再从Redis中获取并补充到Caffeine
        status = (Integer) redisTemplate.opsForValue().get(KEY);
        caffeineCache.put(KEY, status);
        log.info("获取到店铺的营业状态为：{}", status == 1 ? "营业中" : "打烊中");
        return Result.success(status);
    }
}
