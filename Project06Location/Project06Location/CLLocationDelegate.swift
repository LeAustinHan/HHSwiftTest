//
//  CLLocationDelegate.swift
//  Project06Location
//
//  Created by Han Jize on 2020/5/9.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import Foundation

import CoreLocation

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text =  "Error while updating location " + error.localizedDescription
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(locations.first!) { (placemarks, error) in
            guard error == nil else {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            if placemarks!.count > 0 {
                let pm = placemarks!.first
                self.displayLocationInfo(pm)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func displayLocationInfo(_ placemark:CLPlacemark?){
        if let containPlaceMark = placemark {
            locationManager.stopUpdatingLocation()
            
            let locality = (containPlaceMark.locality != nil) ? containPlaceMark.locality : ""
            let postalCode = (containPlaceMark.postalCode != nil) ? containPlaceMark.postalCode : ""
            let adminstrativeArea = (containPlaceMark.administrativeArea != nil) ? containPlaceMark.administrativeArea : ""
            let country = (containPlaceMark.country != nil) ? containPlaceMark.country : ""
            
            self.locationLabel.text  = postalCode! + " " + locality!
            self.locationLabel.text?.append("\n" + adminstrativeArea! + "," + country!)
        }
    }
    
}
