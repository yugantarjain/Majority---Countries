//
//  CountriesViewModel.swift
//  Majority
//
//  Created by Yugantar Jain on 09/09/24.
//

import Foundation
import Combine

@Observable
class CountriesViewModel {
	private var cancellable: AnyCancellable?

	var searchString = ""

	var filteredCountries: [Country] {
		guard !searchString.isEmpty else {
			return countries
		}

		return countries.filter {
			$0.name.common.contains(searchString)
		}
	}

	var countries: [Country] = []

	func getCountries() {
		self.cancellable = NetworkManager.callAPI(urlString: "https://restcountries.com/v3.1/all")
			.receive(on: RunLoop.main)
			.catch { _ in Just(self.countries) }
			.sink {
				self.countries = $0.sorted {
					$0.name.common < $1.name.common
				}
			}
	}

}
