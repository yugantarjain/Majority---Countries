//
//  CountriesView.swift
//  Majority
//
//  Created by Yugantar Jain on 08/09/24.
//

import SwiftUI

struct CountriesView: View {
	@Bindable var viewModel = CountriesViewModel()

    var body: some View {
		NavigationStack {
			List(viewModel.filteredCountries, id: \.name.common) { country in
				NavigationLink {
					CountryDetailView(country: country)
				} label: {
					CountriesListRow(country: country)
				}
			}
			.searchable(text: $viewModel.searchString)
			.autocorrectionDisabled()
			.navigationTitle(LocalizedStrings.countries)
			.task {
				viewModel.getCountries()
			}
		}
    }
}

#Preview {
	CountriesView()
		.environment(\.locale, .init(identifier: "sv"))
}
