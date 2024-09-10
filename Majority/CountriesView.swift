//
//  ContentView.swift
//  Majority
//
//  Created by Yugantar Jain on 08/09/24.
//

import SwiftUI

struct ContentView: View {
	@Bindable var viewModel = ViewModel()

    var body: some View {
		NavigationStack {
			List(viewModel.filteredCountries, id: \.name.common) { country in
				NavigationLink {
					CountryDetailView(country: country)
				} label: {
					HStack {
						Text(country.name.common)
							.font(.headline)

						Spacer()

						AsyncImage(url: URL(string: country.flags.png)) { image in
							image.resizable()
						} placeholder: {
							Color.red
						}
						.frame(width: 64, height: 40)
						.clipShape(.rect(cornerRadius: 4))
					}
				}
			}
			.searchable(text: $viewModel.searchString)
			.autocorrectionDisabled()
			.navigationTitle("Countries")
			.task {
				viewModel.getCountries()
			}
		}
    }
}

struct Country: Decodable {
	let name: Name
	let flags: Flag
	let capital: [String]?
	let region: String
	let currencies: [String: Currency]?
	let languages: [String: String]?

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

#Preview {
    ContentView()
		.environment(\.locale, .init(identifier: "sv"))
}
