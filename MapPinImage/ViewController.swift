//
//  ViewController.swift
//  MapPinImage
//
//  Created by claudio Cavalli on 12/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    var userLocation: CLLocation?
    var selectedAnnotation: MKAnnotation?
    var Pin = [PinValue]()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
        setupLocations()
        
    }

    func setupLocations() {
     
      for _ in 0..<20 {
      let coordinate =  CLLocation(latitude: Double.random(in: 30...46), longitude: Double.random(in: 10...15))
    
        let pin = PinValue.init(itemDescription: "ImagePin", location: coordinate)
        Pin.append(pin)
        
        }
        
        for item in Pin {
            let annotation = MapAnnotation(location: item.location.coordinate, item: item)
            self.mapView.addAnnotation(annotation)
        }
        
    }
    
    
}


extension ViewController: MKMapViewDelegate {
    
   
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "ImagePin"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: String(counter))
            annotationView.frame.size.width  = 36
            annotationView.frame.size.height = 39
            counter += 1
            
        }
        
        return annotationView
    }
    
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.userLocation = userLocation.location
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
      
   
    }
    
    
}
