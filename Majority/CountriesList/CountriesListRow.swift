//
//  CountriesListRow.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import SwiftUI

struct CountriesListRow: View {
	let country: Country

	var body: some View {
		HStack {
			Text(country.name)
				.font(.headline)

			Spacer()

			AsyncImage(url: URL(string: country.flagURL)) { image in
				image
					.resizable()
					.scaledToFill()
			} placeholder: {
				Color.secondary
			}
			.frame(width: Size.mediumLarge, height: Size.medium)
			.clipShape(.rect(cornerRadius: Size.xxSmall))
		}
	}
}

#Preview {
	CountriesListRow(country: .mock)
}
