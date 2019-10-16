package com.docker.dockerfile.bestpractices

import com.docker.dockerfile.bestpractices.api.dto.Record
import com.docker.dockerfile.bestpractices.storage.BeerRepository
import com.fasterxml.jackson.module.kotlin.jacksonObjectMapper
import com.fasterxml.jackson.module.kotlin.readValue
import org.slf4j.LoggerFactory
import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.core.io.Resource

@SpringBootApplication
class BestpracticesApplication {

	private val log = LoggerFactory.getLogger(BestpracticesApplication::class.java)

	@Value(value = "classpath:open-beer-database.json")
	lateinit var openBeer: Resource


	@Bean
	fun init(repository: BeerRepository) = CommandLineRunner {
		if (repository.count() == 0L) {
			val objectMapper = jacksonObjectMapper()

			val beers: List<Record> = objectMapper.readValue(openBeer.inputStream)
			repository.saveAll(beers.map { r -> r.beer })
		}
	}
}

fun main(args: Array<String>) {
	runApplication<BestpracticesApplication>(*args)
}
