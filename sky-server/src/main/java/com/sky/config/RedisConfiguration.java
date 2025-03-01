package com.sky.config;

import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import java.awt.event.ActionListener;

@Configuration
@Slf4j
public class RedisConfiguration {

    /**
     * 参考：https://blog.csdn.net/xueqinmax/article/details/81366087
     <p>
     当前配置类不是必须的，因为 Spring Boot 框架会自动装配 RedisTemplate 对象，但是默认的key序列化器为
     JdkSerializationRedisSerializer，导致我们存到Redis中后的数据和原始数据有差别，故设置为StringRedisSerializer序列化器。
     StringRedisSerializer是将数据序列化为String类型进行存储的序列化器，即将对象转换为字符串进行存储，再将字符串转换为对象进行反序列化
     StringRedisSerializer序列化后的数据比较简洁，节省存储空间，且为可读字符串，方便查看和调试。
     <p>
     JdkSerializationRedisSerializer: JDK的序列化机制是将对象序列化成字节数组进行存储，
     对象中的所有字段都会被序列化，然后反序列化时再将字节数组转换为对象。
     在 Java 中，字节数组（byte[]）是存储二进制数据的数组，每个元素是一个字节（8位，范围 -128~127
     数据在 Redis 中显示为乱码（如 \xAC\xED\x00\x05t\x00\x04key），因为 Redis 客户端默认尝试以字符串解码字节数组。
     序列化后的数据冗长（包含类信息、版本号等），占用更多存储空间。
     **/
    @Bean
    public RedisTemplate redisTemplate(RedisConnectionFactory redisConnectionFactory) {
        log.info("开始创建redis模板对象...");
        RedisTemplate redisTemplate = new RedisTemplate();

        //设置redis的连接工厂对象
        redisTemplate.setConnectionFactory(redisConnectionFactory);
        //设置redis key的序列化器
        redisTemplate.setKeySerializer(new StringRedisSerializer());
        return redisTemplate;
    }
}