//
//  NetworkWeatherManager.swift
//  WeatherApp
//
//  Created by Егор Астахов on 10.11.2021.
//

import Foundation

struct NetworkWeatherManager {
    func fetchCurrentWeather(forCity city: String) {
        // передаем адрес обращения
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(apiKey)"
        // делаем из строки url
        guard let url = URL(string: urlString) else { return }
        // создаем сессию
        let session = URLSession(configuration: .default)
        // создаем запрос
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                let currentWrather = self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
