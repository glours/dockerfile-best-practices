package com.docker.dockerfile.bestpractices.storage

import com.docker.dockerfile.bestpractices.domain.Beer
import org.springframework.data.mongodb.repository.MongoRepository

interface BeerRepository: MongoRepository<Beer, String>{
    fun findByName(name: String): Beer
}