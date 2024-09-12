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
	let countriesAPI = CountriesAPI()

	func getCountries(modelContext: ModelContext) {
		loading = true

		countriesAPI.getCountries { result in
			self.loading = false

			switch result {
				case .success(let countriesResponse):
					for response in countriesResponse {
						let country = Country(from: response)
						modelContext.insert(country)
					}
					
				case .failure(let error):
					print(error)
					self.error = true
			}
		}
	}
	
}
