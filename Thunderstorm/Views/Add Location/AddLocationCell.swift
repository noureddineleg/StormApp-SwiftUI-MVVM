//
//  AddLocationCell.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import SwiftUI

struct AddLocationCell: View {

    // MARK: - Properties

    let viewModel: AddLocationCellViewModel

    let didTapPlusButton: () -> Void

    // MARK: - View
    
    var body: some View {
        HStack {
            Button(action: didTapPlusButton) {
                Image(systemName: "plus")
                    .padding()
                    .tint(.green)
                    .frame(width: 5.0, height: 5.0)
            }
            .padding(.all, 10.0)
            .background(.white)

            Spacer()
                .frame(width: 20.0)

            VStack(alignment: .leading) {
                Text(viewModel.name)
                    .font(.headline)
                    .foregroundColor(.accentColor)
                Text(viewModel.country)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text(viewModel.coordinates)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
    }

}

struct AddLocationCell_Previews: PreviewProvider {
    static var previews: some View {
        AddLocationCell(viewModel: .init(location: .preview)) {
            ()
        }
    }
}
