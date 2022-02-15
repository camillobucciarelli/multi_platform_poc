package com.example.webfluxtest.model;

import lombok.*;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class WeatherEvent {
    private Weather weather;
    private LocalDateTime date;
}
