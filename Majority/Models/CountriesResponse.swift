//
//  CountriesResponse.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import Foundation

/// Country struct for the JSON response from the REST api
struct CountriesResponse: Decodable {
	// Properties
	let name: Name
	let flags: Flag
	let capital: [String]?
	let region: String
	let currencies: [String: Currency]?
	let languages: [String: String]?

	// Supporting structures
	struct Name: Decodable {
		let common: String
		let nativeName: [String: NativeName]?

		var displayNames: [String] {
			let nativeNames = nativeName?.values.map { $0.common } ?? []
			return [common] + nativeNames
		}

		struct NativeName: Decodable {
			let common: String
		}
	}

	struct Flag: Decodable {
		let png: String
	}

	struct Currency: Decodable {
		let name: String
		let symbol: String

		var displayString: String {
			name + " " + "(\(symbol))"
		}
	}
}
