package com.sky.api.config;

import com.sky.api.client.fallback.ShoppingCartClientFallBack;
import com.sky.constant.JwtClaimsConstant;
import com.sky.context.BaseContext;
import feign.Logger;
import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.context.annotation.Bean;

public class DefaultFeignConfig{

    /*
    配置日志级别
     */
    @Bean
    public Logger.Level feignLogLevel(){
        return Logger.Level.FULL;
    }

    @Bean
    public RequestInterceptor userInfoRequestInterceptor(){
        return new RequestInterceptor() {
            @Override
            public void apply(RequestTemplate template) {
                Long id = BaseContext.getCurrentId();
                // 如果不为空则放入请求头中，传递给下游微服务
                if (id != null) {
                    template.header(JwtClaimsConstant.USER_ID, id.toString());
                }
            }
        };
    }

    @Bean
    public ShoppingCartClientFallBack shoppingCartClientFallBack(){
        return new ShoppingCartClientFallBack();
    }

}
