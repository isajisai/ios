//
//  ViewController.swift
//  vaceMe
//
//  Created by user on 8/27/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GMSServices.provideAPIKey("AIzaSyCjZh4112IZyNakEXdScK7k5qK1cx1suO8")
        
        // DEVNOTE: Camera position initialized to SFO airport. MAKE DYNAMIC.
        let camera = GMSCameraPosition.camera(withLatitude: 37.621509, longitude: -122.378931, zoom: 10)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        view = mapView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

