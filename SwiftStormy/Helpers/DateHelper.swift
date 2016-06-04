//
//  DateHelper.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 04/06/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation

class DateHelper {

    static func getFormattedDate(timestamp: Double) -> String {
        let currentDate = NSDate(timeIntervalSince1970: timestamp)
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.MediumStyle
        return formatter.stringFromDate(currentDate)
    }
    
    static func getFormattedTime(timestamp: Double) -> String {
        let currentDate = NSDate(timeIntervalSince1970: timestamp)
        let formatter = NSDateFormatter()
        formatter.timeStyle = NSDateFormatterStyle.MediumStyle
        return formatter.stringFromDate(currentDate)
    }
}