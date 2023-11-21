//
//  Store.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Combine

protocol Store {

    // MARK: - Properties

    var locationsPublisher: AnyPublisher<[Location], Never> { get }

    // MARK: - Methods

    func addLocation(_ location: Location) throws
    func removeLocation(_ location: Location) throws

}
