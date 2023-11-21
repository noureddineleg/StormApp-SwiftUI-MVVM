//
//  GeocodingService.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

protocol GeocodingService {

    // MARK: - Methods

    func geocodeAddressString(_ addressString: String) async throws -> [Location]

}
