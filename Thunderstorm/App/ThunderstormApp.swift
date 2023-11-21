//
//  ThunderstormApp.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI
import Swinject

@main
struct ThunderstormApp: App {

    // MARK: - Initialization

    init() {
        registerServices()
    }
    
    // MARK: - App

    var body: some Scene {
        WindowGroup {
            LocationsView(
                viewModel: .init(
                    store: Container.store,
                    weatherService: WeatherClient()
                )
            )
        }
    }

    // MARK: - Helper Methods

    private func registerServices() {
        Container.shared.register(Store.self) { _ in
            UserDefaults.standard
        }
    }

}
