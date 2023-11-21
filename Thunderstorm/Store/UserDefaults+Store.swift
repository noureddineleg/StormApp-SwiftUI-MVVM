//
//  UserDefaults+Store.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Combine
import Foundation

extension UserDefaults: Store {

    // MARK: - Properties

    var locationsPublisher: AnyPublisher<[Location], Never> {
        publisher(for: \.locations)
            .compactMap { $0 }
            .decode(
                type: [Location].self,
                decoder: JSONDecoder()
            )
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }

}
