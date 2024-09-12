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

	var body: some View {
		NavigationStack {
			CountriesListView(viewModel: viewModel)
				.searchable(text: $viewModel.searchString)
				.autocorrectionDisabled()
				.navigationDestination(for: Country.self) { country in
					CountryDetailView(country: country)
				}
				.navigationTitle(LocalizedStrings.countries)
		}
	}
}

#Preview {
	CountriesView()
		.environment(\.locale, .init(identifier: "sv"))
}
