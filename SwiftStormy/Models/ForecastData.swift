//
//  ForecastData.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 27/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import ObjectMapper

class ForecastData: Mappable {
    
    var time:Double=0.0
    var summary:String?
    var icon:String?
    var sunriseTime:Double?
    var sunsetTime:Double?
    var precipIntensity:Int?
    var precipProbability:Int?
    var temperatureMin: Double?
    var temperatureMax:Double?
    var humidity:Double?
    var ozone:Double?
    var windSpeed:Double?
    var pressure:Double?
    
    
    required init?(_ map: Map) {
    }
    
    func mapping(map:Map) {
        time <- map["time"]
        summary <- map["summary"]
        icon <- map["icon"]
        sunriseTime <- map["sunriseTime"]
        sunsetTime <- map["sunsetTime"]
        precipIntensity <- map["precipIntensity"]
        precipProbability <- map["precipProbability"]
        temperatureMin <- map["temperatureMin"]
        temperatureMax <- map["temperatureMax"]
        humidity <- map["humidity"]
        ozone <- map["ozone"]
        windSpeed <- map["windSpeed"]
        pressure <- map["pressure"]
    }
    
    func getCelciusTemperature() -> Int? {
        if let farenheitTemperature = temperatureMax {
            return Int((farenheitTemperature - 32) / 1.8)
        }
        return nil
    }
}
