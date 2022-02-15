package com.example.webfluxtest.service;

import com.example.webfluxtest.model.UpdateEvent;
import com.example.webfluxtest.model.Weather;
import com.example.webfluxtest.model.WeatherEvent;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;
import reactor.core.publisher.Flux;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Random;
import java.util.stream.Stream;

@Service
@NoArgsConstructor
public class WeatherService {
    public Flux<WeatherEvent> streamWeather() {
        Flux<Long> interval = Flux.interval(Duration.ofSeconds(1));
        Flux<WeatherEvent> events = Flux.fromStream(Stream.generate(() -> new WeatherEvent(new Weather(getTemperature(), getHumidity(), getWindSpeed()), LocalDateTime.now())));
        return Flux.zip(events, interval, (key, value) -> key);
    }

    public Flux<UpdateEvent> updateWeather(Weather weather) {
        Flux<Long> interval = Flux.interval(Duration.ofSeconds(1));
        Flux<UpdateEvent> events = Flux.fromStream(Stream.iterate(new UpdateEvent(0, weather, LocalDateTime.now()), i -> i.getPercentage() <= 100, i -> new UpdateEvent(getUpdatePercentage(i.getPercentage()), weather, LocalDateTime.now())));
        return Flux.zip(events, interval, (key, value) -> key);
    }

    public Weather getWeather() {
        return new Weather(getTemperature(), getHumidity(), getWindSpeed());
    }

    private String getWindSpeed() {
        String[] windSpeeds = "100 km/h,101 km/h,102 km/h,103 km/h,104 km/h".split(",");
        return windSpeeds[new Random().nextInt(windSpeeds.length)];
    }

    private String getHumidity() {
        String[] humidity = "40%,41%,42%,42%,44%,45%,46%".split(",");
        return humidity[new Random().nextInt(humidity.length)];
    }

    private int getUpdatePercentage(int i) {
        if (i == 100) {
            return 101;
        }
        int newUpdatePercentage = new Random().nextInt(50) + i;
        return Math.min(newUpdatePercentage, 100);
    }

    private String getTemperature() {
        String[] temperatures = "19C,19.5C,20C,20.5C,21C,21.5C,22C,22.5C,23C,23.5C,24C".split(",");
        return temperatures[new Random().nextInt(temperatures.length)];
    }
}
