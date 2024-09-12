//
//  CountriesResponse.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import Foundation

/// Country struct for the JSON response from the REST api
struct CountriesResponse: Codable {
	// Properties
	let name: Name
	let flags: Flag
	let capital: [String]?
	let region: String
	let currencies: [String: Currency]?
	let languages: [String: String]?

	// Supporting structures
	struct Name: Codable {
		let common: String
		let nativeName: [String: NativeName]?

		var displayNames: [String] {
			let nativeNames = nativeName?.values.map { $0.common } ?? []
			return [common] + nativeNames
		}

		struct NativeName: Codable {
			let common: String
		}
	}

	struct Flag: Codable {
		let png: String
	}

	struct Currency: Codable {
		let name: String
		let symbol: String

		var displayString: String {
			name + " " + "(\(symbol))"
		}
	}
}

extension CountriesResponse: Equatable {
	static func == (lhs: CountriesResponse, rhs: CountriesResponse) -> Bool {
		lhs.name.common == rhs.name.common &&
		lhs.region == rhs.region
	}
}

extension CountriesResponse {
	static let mock: Self = CountriesResponse(
		name: .init(common: "Germany", nativeName: ["de" : .init(common: "Deutschland")]),
		flags: .init(png: "https://flagcdn.com/w320/de.png"),
		capital: ["Berlin"],
		region: "Europe",
		currencies: ["EUR" : CountriesResponse.Currency(name: "Euro", symbol: "€")],
		languages: ["de" : "German"]
	)
}
