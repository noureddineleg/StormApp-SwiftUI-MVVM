//
//  AddLocationView.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct AddLocationView: View {

    // MARK: - Properties

    @ObservedObject var viewModel: AddLocationViewModel

    var showsAddLocationView: Binding<Bool>

    // MARK: - View

    var body: some View {
        VStack {
            TextField(viewModel.textFieldPlaceholder, text: $viewModel.query)
                .padding()

            switch viewModel.state {
            case .empty:
                Spacer()
            case .querying:
                MessageView(style: .progressView)
            case .message(let message):
                MessageView(style: .message(message))
            case .results(let viewModels):
                List {
                    ForEach(viewModels) { cellViewModel in
                        AddLocationCell(viewModel: cellViewModel) {
                            viewModel.addLocation(with: cellViewModel.id)
                            showsAddLocationView.wrappedValue.toggle()
                        }
                    }
                }
            }
        }
    }

}

struct AddLocationView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = AddLocationViewModel(
            store: PreviewStore(),
            geocodingService: GeocodingPreviewClient()
        )

        return AddLocationView(
            viewModel: viewModel,
            showsAddLocationView: .constant(true)
        )
    }
}

fileprivate struct MessageView: View {

    // MARK: - Types

    enum Style {

        // MARK: - Cases

        case progressView
        case message(String)

    }

    // MARK: - Properties

    let style: Style

    // MARK: - View

    var body: some View {
        VStack {
            Spacer()
            switch style {
            case .progressView:
                ProgressView()
            case .message(let message):
                Text(message)
                    .font(.body)
                    .foregroundColor(.darkGray)
            }
            Spacer()
        }
    }

}
