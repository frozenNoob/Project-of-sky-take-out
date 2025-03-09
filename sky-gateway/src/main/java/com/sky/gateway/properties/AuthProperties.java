package com.sky.gateway.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;

@Data
@ConfigurationProperties(prefix = "sky.auth")
public class AuthProperties {
    private List<String> includePaths;
    private List<String> excludePaths;
}
