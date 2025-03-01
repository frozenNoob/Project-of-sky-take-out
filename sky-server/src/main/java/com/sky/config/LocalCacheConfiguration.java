package com.sky.config;

import com.github.benmanes.caffeine.cache.Cache;
import com.github.benmanes.caffeine.cache.Caffeine;
import com.sky.properties.CaffeineProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.concurrent.TimeUnit;

/**
 * 本地缓存Caffeine配置类
 */
@Configuration
public class LocalCacheConfiguration {

    @Bean("localCacheManager")
    public Cache<String, Object> localCacheManager(CaffeineProperties caffeineProperties) {
        return Caffeine.newBuilder()
                //写入或者更新后过了指定时间，缓存过期并失效
                .expireAfterWrite(caffeineProperties.getExpireAfterWrite(), TimeUnit.SECONDS)
                // 初始的缓存空间大小
                .initialCapacity(caffeineProperties.getInitialCapacity())
                // 缓存的最大条数，通过 Window TinyLfu算法控制整个缓存大小
                .maximumSize(caffeineProperties.getMaximumSize())
                //打开数据收集功能
                .recordStats()
                .build();
    }

}