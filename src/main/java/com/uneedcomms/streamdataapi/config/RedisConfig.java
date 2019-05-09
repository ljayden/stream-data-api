package com.uneedcomms.streamdataapi.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisStandaloneConfiguration;
import org.springframework.data.redis.connection.lettuce.LettuceConnectionFactory;

@Configuration
public class RedisConfig {

    // TODO..
    /*@Value("${REDIS_DEFAULT_HOST}")
    private static final String DEFAULT_HOST;*/
    //private static final String DEFAULT_HOST = "127.0.0.1";
    // redis in ec-2
    private static final String DEFAULT_HOST = "ec2-54-180-120-133.ap-northeast-2.compute.amazonaws.com";

    // TODO..
    /*@Value("${REDIS_DEFAULT_PORT}")
    private static final int DEFAULT_PORT;*/
    private static final int DEFAULT_PORT = 6379;

    private static final String DEFAULT_PASSWORD = "60976712c7f60fa538bcacf402529b41589f589de3058713b4759062cc0110ea";

    private String hostName = DEFAULT_HOST;
    private int port = DEFAULT_PORT;
    private String password = DEFAULT_PASSWORD;

    @Bean
    public LettuceConnectionFactory redisConnectionFactory() {
        //return new LettuceConnectionFactory(new RedisStandaloneConfiguration(hostName, port));
        RedisStandaloneConfiguration redisStandaloneConfiguration = new RedisStandaloneConfiguration(hostName, port);
        redisStandaloneConfiguration.setPassword(password);
        return new LettuceConnectionFactory(redisStandaloneConfiguration);
    }
}
