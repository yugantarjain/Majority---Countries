//
//  Country.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import SwiftData
import SwiftUI

@Model
class Country {
	@Attribute(.unique) var name: String
	var displayNames: [String]
	var flagURL: String
	var capital: String?
	var region: String
	var currencies: [String]?
	var languages: [String]?

	init(name: String, displayNames: [String], flagURL: String, capital: String? = nil, region: String, currencies: [String]? = nil, languages: [String]? = nil) {
		self.name = name
		self.displayNames = displayNames
		self.flagURL = flagURL
		self.capital = capital
		self.region = region
		self.currencies = currencies
		self.languages = languages
	}
}

// Server to swiftdata mapping initialiser
extension Country {
	convenience init(from country: CountriesResponse) {
		self.init(
			name: country.name.common,
			displayNames: country.name.displayNames,
			flagURL: country.flags.png,
			capital: country.capital?.first,
			region: country.region,
			currencies: country.currencies?.values.map { $0.displayString },
			languages: country.languages?.values.map { $0 }
		)
	}
}

// Mock
extension Country {
	static let mock = Country(name: "Germany",
							  displayNames: ["Germany", "Deutschland"],
							  flagURL: "https://flagcdn.com/w320/de.png",
							  capital: "Berlin",
							  region: "Europe",
							  currencies: ["Euro"],
							  languages: ["German"])
}
