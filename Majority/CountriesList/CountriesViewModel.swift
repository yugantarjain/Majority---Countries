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
	var searchString = ""

	var loading = false
	var error = false

	var profileService = CountriesAPI()

	func getCountries(modelContext: ModelContext) {
		self.loading = true

		profileService.getCountries { result in
			self.loading = false

			switch result {
				case .success(let countriesResponse):
					self.error = false
					for response in countriesResponse {
						let country = Country(from: response)
						modelContext.insert(country)
					}

				case .failure:
					self.error = true
			}
		}
	}

}
