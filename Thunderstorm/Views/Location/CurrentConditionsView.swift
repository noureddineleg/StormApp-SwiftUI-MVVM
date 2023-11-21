//
//  CurrentConditionsView.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct CurrentConditionsView: View {

    // MARK: - Properties

    let viewModel: CurrentConditionsViewModel

    // MARK: - View

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.temperature)
                    .font(.largeTitle)

                Group {
                    HStack {
                        Image(systemName: "wind")
                            .foregroundColor(.gray)
                        Text(viewModel.windSpeed)
                    }

                    Spacer()
                        .frame(height: 10.0)

                    Text(viewModel.summary)
                }
                .font(.body)
            }

            Spacer()

            Button {
                viewModel.delete()
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.accentColor)
            }
        }
        .padding()
    }

}

struct CurrentConditionsView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentConditionsView(
            viewModel: .init(
                location: .preview,
                store: PreviewStore(),
                currently: WeatherData.preview.currently
            )
        )
    }
}
