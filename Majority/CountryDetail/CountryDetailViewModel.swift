//
//  CountryDetailViewModel.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import Foundation

@Observable
class CountryDetailViewModel {

	let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

	var currentCountryNameIndex = 0

	func nextElement(country: Country) {
		currentCountryNameIndex = (currentCountryNameIndex + 1) % country.displayNames.count
	}

}
