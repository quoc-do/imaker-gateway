package com.imarker.enpoint;

import org.apache.coyote.Response;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("hello-world")
public class HelloController {
    @GetMapping("/hello")
    public Object hello(){
        return "Hello world";
    }
}