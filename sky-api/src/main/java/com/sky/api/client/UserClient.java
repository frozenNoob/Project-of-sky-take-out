package com.sky.api.client;

import com.sky.api.dto.AddressBook;
import com.sky.api.dto.Result;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

@FeignClient(value = "user-service", path = "/user")
public interface UserClient {
    @GetMapping("/addressBook/{id}")
    Result<AddressBook> getAddressById(@PathVariable Long id);
}
