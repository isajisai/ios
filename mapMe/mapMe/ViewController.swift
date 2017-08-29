//
//  ViewController.swift
//  mapMe
//
//  Created by user on 8/28/17.
//  Copyright © 2017 user. All rights reserved.
//

import UIKit
import GoogleMaps

class VacationDestination: NSObject {
    
    let name: String
    let coordinates: CLLocationCoordinate2D
    let zoom: Float
    
    init(name: String, coordinates: CLLocationCoordinate2D, zoom: Float) {
        self.name = name
        self.coordinates = coordinates
        self.zoom = zoom
    }
    
}

class ViewController: UIViewController {

    var mapView: GMSMapView?
    var currDestination: VacationDestination?
    let destinations = [
            VacationDestination(name: "Embarcadero BART Station", coordinates:                                                                     CLLocationCoordinate2DMake(37.7929, -122.3970), zoom: 15.5),
            VacationDestination(name: "San Francisco Ferry Building", coordinates: CLLocationCoordinate2DMake(37.795556, -122.392222), zoom: 15.5),
            VacationDestination(name: "Exploratorium", coordinates: CLLocationCoordinate2DMake(37.8014, -122.3976), zoom: 15.5)
            ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // init map
        GMSServices.provideAPIKey("AIzaSyAO7LWq6mB3h43-QnAdTQc3wBkHx8XMAFI")
        let camera = GMSCameraPosition.camera(withLatitude: 37.6213, longitude: -122.3790, zoom: 12.5)
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        
        // init location to SFO Airport
        let currLocation = CLLocationCoordinate2DMake(37.6213, -122.3790)
        let marker = GMSMarker(position: currLocation)
        marker.title = "SFO Airport"
        marker.map = mapView
        
        // init navigation buttons
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(ViewController.next as (ViewController) -> () -> ()))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Reset", style: .plain, target: self, action: #selector(ViewController.reset as (ViewController) -> () -> ()))
        navigationItem.leftBarButtonItem?.tintColor = UIColor.red
        
    }
    
    func next() {
        
        if currDestination == nil {
            currDestination = destinations.first
            mapView?.animate(to: GMSCameraPosition.camera(withTarget: currDestination!.coordinates, zoom: currDestination!.zoom))
            let marker = GMSMarker(position: currDestination!.coordinates)
            marker.title = currDestination?.name
            marker.map = mapView
        } else {
            let index = destinations.index(of:currDestination!)
            if (index! + 1) < destinations.count {
                currDestination = destinations[index! + 1]
            } else {
                currDestination = destinations.first
            }
            mapView?.animate(to: GMSCameraPosition.camera(withTarget: currDestination!.coordinates, zoom: currDestination!.zoom))
            let marker = GMSMarker(position: currDestination!.coordinates)
            marker.title = currDestination?.name
            marker.map = mapView
        }
        
    }
    
    func reset() {
        
        currDestination = nil
        mapView?.animate(to: GMSCameraPosition.camera(withTarget: CLLocationCoordinate2DMake(37.6213, -122.3790), zoom: 13))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

