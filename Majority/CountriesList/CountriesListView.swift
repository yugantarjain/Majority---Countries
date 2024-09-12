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
	@Environment(\.modelContext) private var modelContext
	@Bindable var viewModel: CountriesViewModel

	var body: some View {
		List {
			ForEach(countries, id: \.name) { country in
				NavigationLink(value: country) {
					CountriesListRow(country: country)
				}
			}

			if viewModel.loading {
				ProgressView()
			}
		}
		.task {
			if countries.isEmpty {
				viewModel.getCountries(modelContext: modelContext)
			}
		}
		.alert(LocalizedStrings.errorOccurred, isPresented: $viewModel.error) {
			Button(LocalizedStrings.retry) {
				viewModel.getCountries(modelContext: modelContext)
			}
		}
	}

	init(viewModel: CountriesViewModel) {
		let searchString = viewModel.searchString
		_countries = Query(
			filter: #Predicate { searchString.isEmpty ? true : $0.name.localizedStandardContains(searchString) },
			sort: [SortDescriptor(\Country.name)]
		)

		self.viewModel = viewModel
	}
}
