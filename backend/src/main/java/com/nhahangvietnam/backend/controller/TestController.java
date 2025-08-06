package com.nhahangvietnam.backend.controller;

import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/test")
@CrossOrigin(origins = "*")
public class TestController {

    @GetMapping("/hello")
    public String hello() {
        return "Hello from Backend!";
    }

    @PostMapping("/test-signup")
    public String testSignup(@RequestBody Object data) {
        return "Test signup received: " + data.toString();
    }
} 