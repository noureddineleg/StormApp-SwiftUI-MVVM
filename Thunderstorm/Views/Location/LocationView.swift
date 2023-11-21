//
//  LocationView.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct LocationView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: LocationViewModel

    // MARK: - View

    var body: some View {
        VStack(alignment: .leading, spacing: 0.0) {
            switch viewModel.state {
            case .fetching:
                ProgressView()
            case let .data(currentConditionsViewModel: currentConditionsViewModel, forecastViewModel: forecastViewModel):
                CurrentConditionsView(
                    viewModel: currentConditionsViewModel
                )

                Divider()

                ForecastView(
                    viewModel: forecastViewModel
                )
            case .error(message: let message):
                Text(message)
                    .padding()
                    .foregroundColor(.accentColor)
                    .multilineTextAlignment(.center)
            }
        }
        .navigationTitle(viewModel.locationName)
        .task {
            await viewModel.start()
        }
    }

}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                LocationView(
                    viewModel: .init(
                        location: .preview,
                        weatherService: WeatherPreviewClient()
                    )
                )
            }
            NavigationView {
                LocationView(
                    viewModel: .init(
                        location: .preview,
                        weatherService: WeatherPreviewClient(result: .failure(.init()))
                    )
                )
            }
        }
    }
}
