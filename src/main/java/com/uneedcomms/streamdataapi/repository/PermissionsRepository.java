package com.uneedcomms.streamdataapi.repository;

import com.uneedcomms.streamdataapi.domain.Permissions;
import org.springframework.data.repository.CrudRepository;

public interface PermissionsRepository extends CrudRepository<Permissions, String> {

    Permissions findByKey(String key);
}
