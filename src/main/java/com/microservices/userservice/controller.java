package com.microservices.userservice;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controller {
    @GetMapping("/get")
    public String get(){
        return "hello from user ms";
    }
}
