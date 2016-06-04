//
//  ViewController.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 04/06/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import UIKit

class WeatherItemViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var humidity: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var ozone: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windspeed: UILabel!
    
    var cityName:String = ""
    var currentForecast:ForecastData!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        city.text = cityName
        summary.text = currentForecast.summary
        temperature.text = "\(currentForecast.getCelciusTemperature()!)°"
        humidity.text = humidity.text! + "\(currentForecast.humidity!)"
        sunset.text =  sunset.text! + DateHelper.getFormattedTime(currentForecast.sunsetTime!)
        sunrise.text =  sunrise.text! + DateHelper.getFormattedTime(currentForecast.sunriseTime!)
        ozone.text =  ozone.text! + "\(currentForecast.ozone!)"
        pressure.text =  pressure.text! + "\(currentForecast.pressure!)"
        windspeed.text =  windspeed.text! + "\(currentForecast.windSpeed!)"
    }
    
}
