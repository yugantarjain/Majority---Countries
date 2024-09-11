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
			Text(country.name.common)
				.font(.headline)

			Spacer()

			AsyncImage(url: URL(string: country.flags.png)) { image in
				image.resizable()
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
