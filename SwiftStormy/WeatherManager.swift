//
//  WeatherManager.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 28/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation

class WeatherManager {
    let weatherService = WeatherService()
    
    func getWeather(latitude:Double, longitude:Double, completionHandler: Weather -> Void) {
        weatherService.getWeatherFromLocation(48.85844, longitude: 2.294555, completionHandler: completionHandler)
    }
}
