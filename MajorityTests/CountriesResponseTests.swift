//
//  CountriesResponseTests.swift
//  MajorityTests
//
//  Created by Yugantar Jain on 12/09/24.
//

import XCTest
@testable import Majority

final class CountriesResponseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testName() {
		let name = CountriesResponse.Name(common: "Germany", nativeName: [:])
		XCTAssertEqual(name.displayNames, ["Germany"])

		let name2 = CountriesResponse.Name(common: "Germany", nativeName: ["de" : .init(common: "Deutschland")])
		XCTAssertEqual(name2.displayNames, ["Germany", "Deutschland"])
	}

	func testCurrency() {
		let currency = CountriesResponse.Currency(name: "Dollar", symbol: "$")
		XCTAssertEqual(currency.displayString, "Dollar ($)")
	}

	func testMappingToCountryModel() {
		let countriesResponse = CountriesResponse.mock
		let mappedCountry = Country(from: countriesResponse)
		let expectedCountry = Country.mock

		XCTAssertEqual(mappedCountry.name, expectedCountry.name)
		XCTAssertEqual(mappedCountry.capital, expectedCountry.capital)
		XCTAssertEqual(mappedCountry.currencies, expectedCountry.currencies)
		XCTAssertEqual(mappedCountry.displayNames, expectedCountry.displayNames)
		XCTAssertEqual(mappedCountry.flagURL, expectedCountry.flagURL)
		XCTAssertEqual(mappedCountry.languages, expectedCountry.languages)
		XCTAssertEqual(mappedCountry.region, expectedCountry.region)
	}

}
