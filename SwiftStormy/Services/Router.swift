//
//  Router.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 28/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import Alamofire

protocol RouterProtocol: URLRequestConvertible {
    var method: Alamofire.Method { get }
    var path: String { get }
    var URLRequest: NSMutableURLRequest { get }
}

extension RouterProtocol {
    
    var baseUrlString: String {
        return NSBundle.mainBundle().objectForInfoDictionaryKey("ApiUrl") as! String
    }
    
    
    func defaultMutableUrlRequest() -> NSMutableURLRequest {
        let url: NSURL
        url = NSURL(string: baseUrlString)!.URLByAppendingPathComponent(self.path)
        
        let mutableURLRequest = NSMutableURLRequest(URL: url)
        mutableURLRequest.HTTPMethod = method.rawValue
        mutableURLRequest.timeoutInterval = 15
        
        mutableURLRequest.setValue("application/json", forHTTPHeaderField: "Accept")
        
        return mutableURLRequest
    }
}

struct Router{ }
