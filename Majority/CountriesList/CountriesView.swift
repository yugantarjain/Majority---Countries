//
//  CountriesView.swift
//  Majority
//
//  Created by Yugantar Jain on 08/09/24.
//

import SwiftUI
import SwiftData

struct CountriesView: View {
	@Bindable var viewModel = CountriesViewModel()
	@Environment(\.modelContext) private var modelContext

	@Query private var countries: [Country]

    var body: some View {
		NavigationStack {
			List(countries, id: \.name) { country in
				NavigationLink {
					CountryDetailView(country: country)
				} label: {
					CountriesListRow(country: country)
				}
			}
			.searchable(text: $viewModel.searchString)
			.autocorrectionDisabled()
			.navigationTitle(LocalizedStrings.countries)
			.refreshable {
				viewModel.getCountries(modelContext: modelContext)
			}
			.task {
				viewModel.getCountries(modelContext: modelContext)
			}
		}
    }
}

#Preview {
	CountriesView()
		.environment(\.locale, .init(identifier: "sv"))
}
