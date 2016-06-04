//
//  Forecast.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 27/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Forecast: Mappable {
    
    var summary:String?
    var icon:String?
    var data:[ForecastData]?
    
    required init?(_ map: Map) {
    }
    
    func mapping(map:Map) {
        summary <- map["summary"]
        icon <- map["icon"]
        data <- map["data"]
    }
}