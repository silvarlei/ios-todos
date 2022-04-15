//
//  CorelocationDelegate.swift
//  locationTutorial
//
//  Created by silvarlei soares on 11/04/22.
//

import Foundation
import CoreLocation
import MapKit

class CorelocationDelegate: NSObject , CLLocationManagerDelegate , ObservableObject{
    
    @Published var coreRegion = MKCoordinateRegion()
  
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
        
        CLGeocoder().reverseGeocodeLocation(locations[0] ){ places , _ in
            if let place  = places?.first{
                print ("name\(String(describing: place.name)) location\(String(describing: place.location))")
            }
        }
    }
}
