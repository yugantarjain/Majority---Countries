//
//  CountriesViewModel.swift
//  Majority
//
//  Created by Yugantar Jain on 09/09/24.
//

import Foundation
import Combine
import SwiftData

@Observable
class CountriesViewModel {
	private var cancellable: AnyCancellable?

	var searchString = ""

	var countries: [Country] = []

	func getCountries(modelContext: ModelContext) {
		self.cancellable = NetworkManager.callAPI(urlString: "https://restcountries.com/v3.1/all")
			.receive(on: RunLoop.main)
			.catch { _ in Just([CountriesResponse]()) }
			.sink { completion in
				switch completion {
					case .finished:
						return

					case .failure(let error):
						print(error)
				}
			} receiveValue: { countries in
				for countryResponse in countries {
					let country = Country(from: countryResponse)
					modelContext.insert(country)
				}
			}
	}

}
