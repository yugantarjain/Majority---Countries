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

	var body: some View {
		NavigationStack {
			Group {
				if viewModel.loading {
					ProgressView()
				} else if viewModel.error {
					Button("An error occurred. Tap to retry.") {
						viewModel.getCountries(modelContext: modelContext)
					}
				} else {
					CountriesListView(searchString: viewModel.searchString)
				}
			}
			.searchable(text: $viewModel.searchString)
			.autocorrectionDisabled()
			.navigationDestination(for: Country.self, destination: { country in
				CountryDetailView(country: country)
			})
			.navigationTitle(LocalizedStrings.countries)
			.onAppear {
				viewModel.getCountries(modelContext: modelContext)
			}
		}
	}
}

#Preview {
	CountriesView()
		.environment(\.locale, .init(identifier: "sv"))
}
