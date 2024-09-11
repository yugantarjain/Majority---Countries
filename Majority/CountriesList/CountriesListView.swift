//
//  CountriesListView.swift
//  Majority
//
//  Created by Yugantar Jain on 12/09/24.
//

import SwiftUI
import SwiftData

struct CountriesListView: View {
	@Query private var countries: [Country]

	var body: some View {
		List(countries, id: \.name) { country in
			NavigationLink(value: country) {
				CountriesListRow(country: country)
			}
		}
	}

	init(searchString: String) {
		_countries = Query(
			filter: #Predicate { searchString.isEmpty ? true : $0.name.localizedStandardContains(searchString) },
			sort: [SortDescriptor(\Country.name)]
		)
	}
}
