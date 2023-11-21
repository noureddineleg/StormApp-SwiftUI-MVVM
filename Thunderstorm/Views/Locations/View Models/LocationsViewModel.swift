//
//  LocationsViewModel.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Combine
import Foundation

@MainActor
final class LocationsViewModel: ObservableObject {

    // MARK: - Properties

    private let store: Store
    private let weatherService: WeatherService

    // MARK: -

    var title: String {
        "Thunderstorm"
    }
    
    var addLocationTitle: String {
        "Add a Location"
    }
    
    @Published private(set) var locationCellViewModels: [LocationCellViewModel] = []

    var addLocationViewModel: AddLocationViewModel {
        AddLocationViewModel(
            store: store,
            geocodingService: GeocodingClient()
        )
    }

    // MARK: - Initialization

    // MARK: - Initialization

    init(
        store: Store,
        weatherService: WeatherService
    ) {
        self.store = store
        self.weatherService = weatherService
    }

    // MARK: - Public APi

    func start() {
        let weatherService = self.weatherService

        store.locationsPublisher
            .map { locations in
                locations.map { location in
                    LocationCellViewModel(
                        location: location,
                        weatherService: weatherService
                    )
                }
            }
            .eraseToAnyPublisher()
            .assign(to: &$locationCellViewModels)
    }

}
