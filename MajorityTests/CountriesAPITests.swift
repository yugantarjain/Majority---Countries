//
//  MajorityTests.swift
//  MajorityTests
//
//  Created by Yugantar Jain on 08/09/24.
//

import XCTest
@testable import Majority

final class MajorityTests: XCTestCase {
	var urlSession: URLSession!
	var countriesAPI: CountriesAPI!

    override func setUpWithError() throws {
		// Set url session for mock networking
		let configuration = URLSessionConfiguration.ephemeral
		configuration.protocolClasses = [MockURLProtocol.self]
		urlSession = URLSession(configuration: configuration)
		countriesAPI = CountriesAPI(urlSession: urlSession)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
		urlSession = nil
		super.tearDown()
    }

    func testGetCountries() throws {
		// Get request url
		let endpoint = GetCountriesEndpoint()
		let url = URL(string: endpoint.baseURL + endpoint.path)

		// Create mock data for server response
		let mockJSON = [CountriesResponse.mock]
		let mockData = try JSONEncoder().encode(mockJSON)

		MockURLProtocol.testURLs = [url: mockData]

		// Expectation. Used for testing async code.
		let expectation = XCTestExpectation(description: "response")

		countriesAPI.getCountries { result in
			switch result {
				case .success(let response):
					XCTAssertEqual(response, mockJSON)
					expectation.fulfill()

				case .failure:
					XCTFail()
					expectation.fulfill()
			}
		}
		wait(for: [expectation], timeout: 1)
    }

}
