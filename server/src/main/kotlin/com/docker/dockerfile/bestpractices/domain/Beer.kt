package com.docker.dockerfile.bestpractices.domain

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty
import org.springframework.data.annotation.Id

@JsonIgnoreProperties(ignoreUnknown = true)
data class Beer(@Id var id: String = "",
                @JsonProperty("name") val name: String,
                var coordinates: List<Double> = emptyList())