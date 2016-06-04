//
//  LocationManager.swift
//  SwiftStormy
//
//  Created by Florian Ganzin on 04/06/16.
//  Copyright © 2016 Florian Ganzin. All rights reserved.
//

import Foundation
import CoreLocation
import RxSwift
import RxCocoa

class LocationManager {
    
    // nil : not determined, true: authorized, false: not authorized
    var authorized: Observable<Bool?>
    var location: Observable<CLLocationCoordinate2D> = Observable.just(CLLocationCoordinate2D(latitude: -200, longitude: 200))
    let locationManager = CLLocationManager()
    
    init() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        authorized = Observable.just(false)
            .map({ _ in CLLocationManager.authorizationStatus() })
            .observeOn(MainScheduler.instance)
            .concat(locationManager.rx_didChangeAuthorizationStatus)
            .observeOn(ConcurrentDispatchQueueScheduler(globalConcurrentQueueQOS: .Default))
            .distinctUntilChanged()
            .map({ authorizedStatus in
                switch authorizedStatus {
                case .AuthorizedAlways, .AuthorizedWhenInUse:
                    return true
                case .NotDetermined:
                    return nil
                case .Restricted, .Denied:
                    return false
                }
            })
            .catchErrorJustReturn(false)
        
        location = Observable.just([])
                            .observeOn(MainScheduler.instance)
                            .flatMap({_ in self.locationManager.rx_didUpdateLocations})
                            .filter { $0.count > 0 }
                            .map({ return $0.last!.coordinate });
    }
    
    func getCurrentLocation() -> Observable<CLLocationCoordinate2D> {
        return authorized
            .flatMap({ authorized -> Observable<CLLocationCoordinate2D> in
                
                guard let authorized = authorized else {
                    self.locationManager.requestWhenInUseAuthorization()
                    return Observable.empty()
                }
                
                if authorized {
                    self.locationManager.requestLocation()
                    return self.location
                } else {
                    return Observable.just(CLLocationCoordinate2D(latitude: -200, longitude: 200))
                }
            })
            // We just need one position updated
            .take(1)
            .map({ coordinate in
                print(coordinate)
                return coordinate
            })
    }
    
}