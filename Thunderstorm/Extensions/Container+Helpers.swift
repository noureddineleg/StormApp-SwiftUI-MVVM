//
//  Container+Helpers.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Swinject

extension Container {

    // MARK: - Properties

    static let shared = Container()

    // MARK: - Services

    static var store: Store {
        shared.resolve(Store.self)!
    }

}
