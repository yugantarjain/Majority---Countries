//
//  CountryDetailView.swift
//  Majority
//
//  Created by Yugantar Jain on 09/09/24.
//

import SwiftUI

struct CountryDetailView: View {
	@State private var currentIndex = 0
	let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()

	let country: Country

    var body: some View {
		VStack {
			AsyncImage(url: URL(string: country.flags.png)) { image in
				image
					.resizable()
					.scaledToFill()
					.clipShape(Circle())
					.overlay {
						Circle()
							.stroke(.white, lineWidth: 4)
					}
					.shadow(radius: 10)
			} placeholder: {
				Color.red
			}
			.frame(width: 160, height: 160)

			Text(country.name.displayNames[currentIndex])
				.font(.largeTitle)
				.bold()

			GroupBox("Capital") {
				HStack {
					Text(country.capital?.first ?? "")
					Spacer()
				}
			}

			GroupBox("Region") {
				HStack {
					Text(country.region)
					Spacer()
				}
			}

			GroupBox("Currencies") {
				HStack {
					Text(country.currencies?.values.map { $0.displayString }.joined(separator: "\n") ?? "")
					Spacer()
				}
			}

			GroupBox("Languages") {
				HStack {
					Text(country.languages?.values.joined(separator: "\n") ?? "")
					Spacer()
				}
			}

			Spacer()
		}
		.padding()
		.navigationBarTitleDisplayMode(.inline)
		.onReceive(timer) { _ in
			withAnimation {
				nextElement()
			}
		}
    }

	private func nextElement() {
		currentIndex = (currentIndex + 1) % country.name.displayNames.count
	}
}

#Preview {
	CountryDetailView(
		country: Country(
			name: .init(common: "Germany", nativeName: ["de" : .init(common: "Deutschland")]),
			flags: .init(png: "https://flagcdn.com/w320/de.png"),
			capital: ["Berlin"],
			region: "Europe", 
			currencies: ["EUR" : Country.Currency(name: "Euro", symbol: "€")], 
			languages: ["de" : "German"]
		)
	)
}
