package com.docker.dockerfile.bestpractices.api.dto

import com.docker.dockerfile.bestpractices.domain.Beer
import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import com.fasterxml.jackson.annotation.JsonProperty

@JsonIgnoreProperties(ignoreUnknown = true)
data class Record(@JsonProperty("fields") val beer: Beer) {
}