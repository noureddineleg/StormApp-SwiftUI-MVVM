//
//  LocationsView.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct LocationsView: View {

    // MARK: - Properties

    @ObservedObject private(set) var viewModel: LocationsViewModel

    @State private var showsAddLocationView = false
    
    // MARK: - View
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 20.0) {
                    Button(viewModel.addLocationTitle) {
                        showsAddLocationView.toggle()
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .clipShape(Capsule())
                    
                    ForEach(viewModel.locationCellViewModels) { viewModel in
                        NavigationLink {
                            LocationView(viewModel: viewModel.locationViewModel)
                        } label: {
                            LocationCell(viewModel: viewModel)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Thunderstorm")
            .sheet(isPresented: $showsAddLocationView) {
                AddLocationView(
                    viewModel: viewModel.addLocationViewModel,
                    showsAddLocationView: $showsAddLocationView
                )
            }
        }
        .onAppear {
            viewModel.start()
        }
    }

}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView(
            viewModel: .init(
                store: PreviewStore(),
                weatherService: WeatherPreviewClient()
            )
        )
    }
}
