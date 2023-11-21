//
//  WeatherService.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

protocol WeatherService {

    // MARK: - Methods

    func weather(for location: Location) async throws -> WeatherData

}
