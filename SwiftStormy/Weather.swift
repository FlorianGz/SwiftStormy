//
//  SwiftS.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 27/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class Weather: Mappable {
    
    var latitude:Double = 0.0
    var longitude:Double = 0.0
    var timezone:String?
    var offset:Int?
    var minutely:Forecast?
    var hourly:Forecast?
    var daily:Forecast?
    
    init () {
    }
    
    required init?(_ map: Map) {
    }
    
    func mapping(map:Map) {
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        timezone <- map["timezone"]
        offset <- map["offset"]
        minutely <- map["minutely"]
        hourly <- map["hourly"]
        daily <- map["daily"]
    }
    
}