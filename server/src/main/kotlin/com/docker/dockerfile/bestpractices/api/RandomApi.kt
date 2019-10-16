package com.docker.dockerfile.bestpractices.api

import com.docker.dockerfile.bestpractices.domain.Beer
import com.docker.dockerfile.bestpractices.storage.BeerRepository
import org.springframework.web.bind.annotation.RestController
import org.springframework.web.bind.annotation.RequestMapping
import java.util.*


@RestController
class RandomApi(val beerRepository: BeerRepository) {

    @RequestMapping("/")
    fun index(): String {
        return "Hello Devoxx 👋"
    }

    @RequestMapping("/beers")
    fun list(): List<Beer> {
        return beerRepository.findAll()
    }

    @RequestMapping("/beer")
    fun random(): Beer {
        val beers =  beerRepository.findAll()
        beers.shuffle()
        return beers.first()
    }
}