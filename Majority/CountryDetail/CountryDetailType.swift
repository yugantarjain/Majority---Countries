//
//  CountryDetailType.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import SwiftUI

enum CountryDetailType {
	case capital
	case region
	case currencies
	case languages

	var title: LocalizedStringKey {
		switch self {
			case .capital:
				return LocalizedStrings.capital

			case .region:
				return LocalizedStrings.region

			case .currencies:
				return LocalizedStrings.currencies

			case .languages:
				return LocalizedStrings.languages
		}
	}

	var icon: String {
		switch self {
			case .capital:
				return SFSymbol.pin

			case .region:
				return SFSymbol.regionGlobe

			case .currencies:
				return SFSymbol.euro

			case .languages:
				return SFSymbol.globe
		}
	}

	func detail(country: Country) -> String? {
		switch self {
			case .capital:
				return country.capital

			case .region:
				return country.region

			case .currencies:
				return country.currencies?.joined(separator: "\n")

			case .languages:
				return country.languages?.joined(separator: "\n")
		}
	}
}
