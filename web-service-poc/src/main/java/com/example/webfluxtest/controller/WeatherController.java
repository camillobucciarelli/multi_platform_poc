package com.example.webfluxtest.controller;

import com.example.webfluxtest.model.UpdateEvent;
import com.example.webfluxtest.model.Weather;
import com.example.webfluxtest.model.WeatherEvent;
import com.example.webfluxtest.service.WeatherService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import reactor.core.publisher.Flux;

@Slf4j
@RestController
@AllArgsConstructor
public class WeatherController {
    private final WeatherService service;

    @GetMapping(value = "/weather-stream", produces = MediaType.APPLICATION_STREAM_JSON_VALUE)
    public Flux<WeatherEvent> getWeatherStream() {
        return service.streamWeather();
    }

    @PostMapping(value = "/weather-stream", produces = MediaType.APPLICATION_STREAM_JSON_VALUE)
    public Flux<UpdateEvent> getWeather(@RequestBody Weather body) {
        return service.updateWeather(body);
    }

    @GetMapping(value = "/weather", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Weather getWeather() {
        return service.getWeather();
    }

    @PostMapping(value = "/weather", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public Weather setWeather(@RequestBody Weather body) {
        return body;
    }
}
