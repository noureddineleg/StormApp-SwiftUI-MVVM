//
//  WeatherData+Preview.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

extension WeatherData {

    static var preview: Self {
        let url = Bundle.main.url(
            forResource: "clearsky",
            withExtension: "json"
        )!

        let data = try! Data(contentsOf: url)

        return try! ClearSkyDecoder().decode(
            WeatherData.self,
            from: data
        )
    }

}
