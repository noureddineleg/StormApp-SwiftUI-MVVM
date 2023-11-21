//
//  ClearSkyFormatterTests.swift
//  ThunderstormTests
//
//  Copyright Cocoacasts
//  Created by Bart Jacobs
//

import XCTest
@testable import Thunderstorm

final class ClearSkyFormatterTests: XCTestCase {

    // MARK: - Tests for Format Wind Speed

    func testFormatWindSpeed() throws {
        let locale = Locale(identifier: "nl-BE")
        let formatter = ClearSkyFormatter(locale: locale)

        XCTAssertEqual(
            formatter.formatWindSpeed(12.35),
            "20 km/u"
        )
    }

    // MARK: - Tests for Format Temperature

    func testFormatTemperature() throws {
        let locale = Locale(identifier: "nl-BE")
        let formatter = ClearSkyFormatter(locale: locale)

        XCTAssertEqual(
            formatter.formatTemperature(32.0),
            "0 °C"
        )
    }

}
