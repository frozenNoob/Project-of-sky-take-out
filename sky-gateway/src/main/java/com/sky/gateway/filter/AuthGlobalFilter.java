package com.sky.gateway.filter;

import cn.hutool.core.collection.CollectionUtil;
import com.sky.gateway.constant.JwtClaimsConstant;
import com.sky.gateway.properties.AuthProperties;
import com.sky.gateway.properties.JwtProperties;
import com.sky.gateway.utils.JwtTool;
import io.jsonwebtoken.Claims;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.Ordered;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.List;

@Slf4j
@Component
@RequiredArgsConstructor
//使用后，该类中使用AuthProperties对象前，会把AuthProperties注册到IOC容器中。所以无需在AuthProperties类处加@Component
@EnableConfigurationProperties(AuthProperties.class)
public class AuthGlobalFilter implements GlobalFilter, Ordered {

    private final AuthProperties authProperties;

    private final JwtProperties jwtProperties;

    private final AntPathMatcher antPathMatcher = new AntPathMatcher();

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        // 1.获取Request
        ServerHttpRequest request = exchange.getRequest();
        // 2.判断是否不需要拦截
        if (isExclude(request.getPath().toString())) {
            // 无需拦截，直接放行
            return chain.filter(exchange);
        }
        // 3.获取请求头中的token
        String token = null;
        List<String> headers = request.getHeaders().get(jwtProperties.getUserTokenName());
        if (!CollectionUtil.isEmpty(headers)) {
            token = headers.get(0);
        }
        // 4.校验并解析token
        String userId;
        try {
            log.info("jwt校验:{}", token);
            Claims claims = JwtTool.parseJWT(jwtProperties.getUserSecretKey(), token);
            userId = claims.get(JwtClaimsConstant.USER_ID).toString();

        } catch (RuntimeException e) {
            // 如果无效，拦截
            ServerHttpResponse response = exchange.getResponse();
            response.setRawStatusCode(401);
            return response.setComplete();
        }

        System.out.println("在全局过滤器中，userId == " + userId);
        // 5.传递用户信息
        ServerWebExchange ex = exchange.mutate()
                .request(b -> b.header(JwtClaimsConstant.USER_ID, userId))
                .build();

        // 6.放行
        return chain.filter(ex);
    }

    private boolean isExclude(String antPath) {
        for (String pathPattern : authProperties.getExcludePaths()) {
            if (antPathMatcher.match(pathPattern, antPath)) {
                return true;
            }
        }
        return false;
    }

    @Override
    public int getOrder() {
        return 0;
    }
}