package com.sky.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;
@Component
@ConfigurationProperties(prefix = "sky.caffeine")
@Data
public class CaffeineProperties {
    //有效时间（以秒为单位）
    int expireAfterWrite;
    // 初始的缓存空间大小
    int initialCapacity;
    // 缓存的最大条数，通过 Window TinyLfu算法控制整个缓存大小
    int maximumSize;

}
