//
//  CountryDetailViewModelTests.swift
//  MajorityTests
//
//  Created by Yugantar Jain on 12/09/24.
//

import XCTest
@testable import Majority

final class CountryDetailViewModelTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNextElement() {
		let viewModel = CountryDetailViewModel()
		let country = Country.mock
		country.displayNames = ["A", "B"]

		XCTAssertEqual(viewModel.currentCountryNameIndex, 0)

		viewModel.nextElement(country: country)
		XCTAssertEqual(viewModel.currentCountryNameIndex, 1)

		viewModel.nextElement(country: country)
		XCTAssertEqual(viewModel.currentCountryNameIndex, 0)
    }

}
