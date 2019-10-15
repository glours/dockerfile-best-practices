package com.docker.dockerfile.bestpractices.api

import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestMapping



@RestController
class RandomApi {

    @RequestMapping("/")
    fun index(): String {
        return "Hello Devoxx 👋"
    }
}