package com.uneedcomms.streamdataapi.runner;

import com.uneedcomms.streamdataapi.domain.Permissions;
import com.uneedcomms.streamdataapi.repository.PermissionsRepository;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
public class RedisTestRunner implements ApplicationRunner {

    private PermissionsRepository permissionsRepository;

    public RedisTestRunner(PermissionsRepository permissionsRepository) {
        this.permissionsRepository = permissionsRepository;
    }

    @Override
    public void run(ApplicationArguments args) throws Exception {
        Permissions permissions = new Permissions();
        permissions.setKey("b8de2234-085c-43f5-b1ea-31d685dcafa1");
        permissions.setAppId("uneedcomms");
        permissions.setStatus("active");
        Permissions savedPermissions01 = permissionsRepository.save(permissions);
        permissions.setKey("8122f28a-1481-4471-a1a4-a7fddbc30ac1");
        permissions.setStatus("inactive");
        Permissions savedPermissions02 = permissionsRepository.save(permissions);
        permissions.setKey("1234-1234-1234");
        permissions.setStatus("inactive");
        Permissions savedPermissions03 = permissionsRepository.save(permissions);

        System.out.println(savedPermissions01);
        System.out.println(savedPermissions02);
        System.out.println(savedPermissions03);

        String key = "b8de2234-085c-43f5-b1ea-31d685dcafa1";
//        Permissions findedPermissions = permissionsRepository.findByKey(key);
        Optional<Permissions> findedPermissions = permissionsRepository.findById(key);

        String status = "";
        if(findedPermissions.isPresent()){
          status = findedPermissions.get().getStatus();
        } else {
            status = "no one match";
        }

        System.out.println("===");
        System.out.println(findedPermissions.get().getKey());
        System.out.println(findedPermissions.get().getAppId());
        System.out.println(findedPermissions.get().getStatus());
        System.out.println("===");
    }
}
