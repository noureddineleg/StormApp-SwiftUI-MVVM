//
//  Geocoder.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import CoreLocation

protocol Geocoder {

    func geocodeAddressString(_ addressString: String) async throws -> [CLPlacemark]

}
