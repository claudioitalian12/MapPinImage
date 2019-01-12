//
//  MyAnnotation.swift
//  MapPinImage
//
//  Created by claudio Cavalli on 12/01/2019.
//  Copyright © 2019 claudio Cavalli. All rights reserved.
//

import Foundation
import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    let coordinate: CLLocationCoordinate2D
    let title: String?
    let item: PinValue
    
    init(location: CLLocationCoordinate2D, item: PinValue) {
        self.coordinate = location
        self.item = item
        self.title = item.itemDescription
        
        super.init()
    }
}

