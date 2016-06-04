//
//  WeatherDatasource.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 02/06/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import UIKit

class WeatherDatasource: NSObject, UITableViewDataSource {
    var weather: Weather
    
    init(weather:Weather) {
        self.weather = weather
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.daily?.data?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("weatherCell", forIndexPath: indexPath) as! WeatherCell
        if let dailyForecastData = weather.daily?.data {
            let currentData = dailyForecastData[indexPath.row]
            cell.summary?.text = currentData.summary ?? ""
            cell.time?.text = DateHelper.getFormattedDate(currentData.time)
            if let currentIcon = currentData.icon {
                cell.icon.image = UIImage(named: currentIcon)
            }
            
            if currentData.getCelciusTemperature() != nil {
                cell.temperature.text = "\(currentData.getCelciusTemperature()!)°"
            }
        }
        return cell
    }
}
