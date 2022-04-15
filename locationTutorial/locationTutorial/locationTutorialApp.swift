//
//  locationTutorialApp.swift
//  locationTutorial
//
//  Created by silvarlei soares on 11/04/22.
//

import SwiftUI
import CoreLocation

@main
struct locationTutorialApp: App {
    
    let locationManager  = CLLocationManager()
    let corelocationDelegate = CorelocationDelegate()
    
    init(){
        locationManager.delegate = corelocationDelegate
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.distanceFilter = 35
        
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        print("qualqu")
        
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(coreLocationDelegate: CorelocationDelegate())
        }
    }
}



