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
    var sunriseTime:String?
    var sunsetTime:String?
    var precipIntensity:Int?
    var precipProbability:Int?
    var temperatureMin: Double?
    var temperatureMax:Double?
    var humidity:Double?
    
    
    required init?(_ map: Map) {
    }
    
    func mapping(map:Map) {
        time <- map["time"]
        summary <- map["summary"]
        icon <- map["icon"]
        sunsetTime <- map["sunriseTime"]
        sunsetTime <- map["sunsetTime"]
        precipIntensity <- map["precipIntensity"]
        precipProbability <- map["precipProbability"]
        temperatureMin <- map["temperatureMin"]
        temperatureMax <- map["temperatureMax"]
        humidity <- map["humidity"]
    }
    
    func getFormattedDate() -> String {
        let currentDate = NSDate(timeIntervalSince1970: time)
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return formatter.stringFromDate(currentDate)
    }
    
    func getCelciusTemperature() -> Int? {
        if let farenheitTemperature = temperatureMax {
            return Int((farenheitTemperature - 32) / 1.8)
        }
        return nil
    }
}
