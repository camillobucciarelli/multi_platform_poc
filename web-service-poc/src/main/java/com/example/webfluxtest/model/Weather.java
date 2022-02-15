package com.example.webfluxtest.model;

import lombok.*;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class Weather {
    private String temperature;
    private String humidity;
    private String windSpeed;
}
