//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Егор Астахов on 11.11.2021.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
    let feelsLike: Double
    // изменяем ключи
    enum CodingKeys: String, CodingKey{
        case temp
        // получаем ответ по снейк кейс, а сохраняем по кемел кейс
        case feelsLike = "feels_like"
    }
}

struct Weather: Codable {
    let id: Int
}

