package com.uneedcomms.streamdataapi.domain;

import lombok.Getter;
import lombok.Setter;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

@Getter @Setter
@RedisHash("shop")
public class Shop {

    @Id
    private String key;
    private String appId;
    private String status;
}
