//
//  Router.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 28/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import Alamofire

extension Router {
    
    enum Weather: RouterProtocol {
        case getWeather(latitude: Double, longitude:Double)
        
        var method : Alamofire.Method {
            switch self {
            case .getWeather:
                return .GET
            }
        }
        
        var path: String {
            switch self {
            case .getWeather(let latitude, let longitude):
                return "/\(latitude),\(longitude)"
            }
        }
        
        var URLRequest : NSMutableURLRequest {
            let parameters: [String : AnyObject] = [:]
            switch self {
            case .getWeather( _, _):
               break
            }
            
            return ParameterEncoding.URL.encode(defaultMutableUrlRequest(), parameters: parameters).0
        }
    }
}
