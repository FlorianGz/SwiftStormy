//
//  ViewController.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 27/05/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView : UITableView!
    var refreshControl = UIRefreshControl()
    var dataSource:WeatherDatasource!
    let weatherManager = WeatherManager()
    var locationManager = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = WeatherDatasource(weather: Weather())
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        //set pull to refresh 
        refreshControl.addTarget(self, action: #selector(WeatherViewController.onRefresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
        tableView?.addSubview(refreshControl)
        
        getWeather()
    }
    
    //get weather for current position
    func getWeather() {
        locationManager.getCurrentLocation()
            .doOnNext({coordinate in
                self.weatherManager.getWeather(coordinate.latitude, longitude: coordinate.longitude, completionHandler: self.refreshWeatherHandler)
            })
            .subscribe()
    }
    
    //Click on a daily forecast info
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("cell clicked \(indexPath.row)")
        //performSegueWithIdentifier("weatherSegue", sender: self)
    }
    
    //Pull to refresh method
    func onRefresh(sender:AnyObject) {
        getWeather()
    }
    
    //delegate in charge of refreshing the tableView
    func refreshWeatherHandler(weather: Weather) {
        dataSource.weather = weather
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "weatherSegue" {
            let destController = segue.destinationViewController as! WeatherItemViewController,
            forecastIndex = tableView.indexPathForSelectedRow?.row
            destController.currentForecast = (dataSource.weather.daily?.data![forecastIndex!])!
            destController.cityName = dataSource.weather.timezone!
        }
    }
}

