//
//  ViewController.swift
//  WeatherApp
//
//  Created by Егор Астахов on 10.11.2021.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var weatherIconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var feelsLikeTemperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    var networkWeatherManager = NetworkWeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
    }
    
    
    @IBAction func searchPressed(_ sender: UIButton) {
        self.presentSearchAlertController(withTitle: "Enter city name", message: nil, style: .alert) { city in
            self.networkWeatherManager.fetchCurrentWeather(forCity: city)
        }
    }
    

}

