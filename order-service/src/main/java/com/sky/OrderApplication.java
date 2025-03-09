package com.sky;

import com.sky.api.config.DefaultFeignConfig;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement //开启注解方式的事务管理
@Slf4j//日志记录
@EnableCaching//开发缓存注解功能
@EnableScheduling //开启任务调度
//开启OpenFeign,以简化对其他服务的访问操作
@EnableFeignClients(basePackages = "com.sky.api.client", defaultConfiguration = DefaultFeignConfig.class)
public class OrderApplication {
    public static void main(String[] args) {
        SpringApplication.run(OrderApplication.class, args);
        log.info("server started");
    }
}
