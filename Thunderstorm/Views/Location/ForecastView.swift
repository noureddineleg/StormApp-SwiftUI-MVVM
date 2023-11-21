//
//  ForecastView.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct ForecastView: View {

    // MARK: - Properties

    let viewModel: ForecastViewModel

    // MARK: - View

    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem()]) {
                ForEach(viewModel.forecastCellViewModels) { viewModel in
                    ForecastCell(viewModel: viewModel)
                }
            }
            .padding()
        }
    }

}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(
            viewModel: .init(
                forecast: WeatherData.preview.forecast
            )
        )
    }
}
