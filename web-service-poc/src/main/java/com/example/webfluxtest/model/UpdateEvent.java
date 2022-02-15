package com.example.webfluxtest.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UpdateEvent {
    private int percentage;
    private Weather weather;
    private LocalDateTime date;
}
