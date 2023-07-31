//
//  LocationModel.swift
//  Africa
//
//  Created by Matheus Xavier on 30/07/23.
//

import Foundation
import CoreLocation

struct Location: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
