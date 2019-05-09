package com.uneedcomms.streamdataapi.runner;

import com.uneedcomms.streamdataapi.domain.Shop;
import com.uneedcomms.streamdataapi.repository.ShopRepository;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class RedisTestRunner implements ApplicationRunner {

    private ShopRepository shopRepository;

    public RedisTestRunner(ShopRepository shopRepository) {
        this.shopRepository = shopRepository;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        Shop shop = new Shop();
        shop.setKey("1234-567890-abcd");
        shop.setAppId("uneedcomms");
        shop.setStatus("active");
        Shop savedShop = shopRepository.save(shop);
        System.out.println(savedShop);

        int size = 0;
        Iterable<Shop> shops = shopRepository.findAll();
        for (Shop s: shops) {
            size++;
            System.out.println(s.getAppId()+", "+s.getKey()+", "+s.getStatus());
        }
        System.out.println(size);

        shops.forEach(s -> {
            System.out.println(s.getAppId()+", "+s.getKey()+", "+s.getStatus());
        });

    }
}
