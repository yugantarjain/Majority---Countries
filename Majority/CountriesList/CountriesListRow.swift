//
//  CountriesListRow.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import SwiftUI

struct CountriesListRow: View {
	let country: Country
	@State private var flagData = Data()

	var body: some View {
		HStack {
			Text(country.name)
				.font(.headline)

			Spacer()

			Image(uiImage: UIImage(data: flagData) ?? .init())
				.resizable()
				.frame(width: Size.mediumLarge, height: Size.medium)
				.clipShape(.rect(cornerRadius: Size.xxSmall))
		}
		.task {
			Task {
				self.flagData = try await country.flagData
			}
		}
	}
}

#Preview {
	CountriesListRow(country: .mock)
}
