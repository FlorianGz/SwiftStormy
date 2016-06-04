//
//  WeatherService.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 28/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import Alamofire


class WeatherService {
    
    func getWeatherFromLocation(latitude: Double, longitude:Double, completionHandler: Weather -> Void) {
        Alamofire.request(Router.Weather.getWeather(latitude: latitude, longitude:longitude))
                 .responseObject(completionHandler: {(response : Response<Weather, NSError>) in
                    switch (response.result) {
                        case .Success:
                            if let weather = response.result.value {
                                print(weather.daily?.data?.count)
                                completionHandler(weather)
                            }
                        
                        case .Failure:
                            print("error")
                    
                   }
        })
    }
}