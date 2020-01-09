//
//  ViewController.swift
//  locationAware_iOS
//
//  Created by Ankita Jain on 2020-01-09.
//  Copyright © 2020 Ankita Jain. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {
    
    var locationManager=CLLocationManager()
    @IBOutlet weak var lblLatitude: UILabel!
    @IBOutlet weak var lblLongitude: UILabel!
    @IBOutlet weak var lblSpeed: UILabel!
    @IBOutlet weak var lblCourse: UILabel!
    @IBOutlet weak var lblAltitude: UILabel!
    @IBOutlet weak var lblAddrtess: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate=self
        locationManager.desiredAccuracy=kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location=locations[0]
        lblLatitude.text=String(location.coordinate.latitude)
        lblLongitude.text=String(location.coordinate.longitude)
        lblSpeed.text=String(location.speed)
        lblCourse.text=String(location.course)
        lblAltitude.text=String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            if let error=error
            {
                print(error)
            }
            else
            {
                if let placemark=placemarks?[0]
                              {
                                    var address=""
                                    if placemark.subThoroughfare != nil
                                      {
                                          address+=placemark.subThoroughfare! + "\n"
                                   }
                              
                               if placemark.thoroughfare != nil{
                                   address+=placemark.thoroughfare! + "\n"
                               }
                               
                              
                               if placemark.subLocality != nil
                               {
                                   address+=placemark.subLocality! + "\n"
                               }
                              
                               if placemark.subAdministrativeArea != nil
                               {
                                   address+=placemark.subAdministrativeArea! + "\n"
                               }
                               
                              
                               if placemark.postalCode != nil
                               {
                                   address+=placemark.postalCode! + "\n"
                               }
                               
                              
                               if placemark.country != nil
                               {
                                   address+=placemark.country! + "\n"
                               }
                               
                                self.lblAddrtess.text=address
                               }
            }
        }
        lblAddrtess.text=String(location.coordinate.latitude)
        
    }


}

