package com.docker.dockerfile.bestpractices

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class BestpracticesApplication

fun main(args: Array<String>) {
	runApplication<BestpracticesApplication>(*args)
}
