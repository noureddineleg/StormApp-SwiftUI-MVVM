//
//  ClearSkyDecoder.swift
//  Thunderstorm
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import Foundation

final class ClearSkyDecoder: JSONDecoder {

    // MARK: - Initialization

    override init() {
        super.init()

        dateDecodingStrategy = .secondsSince1970
    }

}
