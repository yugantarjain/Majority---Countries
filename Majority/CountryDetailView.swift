//
//  CountryDetailView.swift
//  Majority
//
//  Created by Yugantar Jain on 09/09/24.
//

import SwiftUI

struct CountryDetailView: View {
	let country: Country
	var viewModel = CountryDetailViewModel()

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

			Text(country.name.displayNames[viewModel.currentCountryNameIndex])
				.font(.largeTitle)
				.bold()

			CountryDetailSegmentView(country: country, type: .capital)
			CountryDetailSegmentView(country: country, type: .region)
			CountryDetailSegmentView(country: country, type: .currencies)
			CountryDetailSegmentView(country: country, type: .languages)

			Spacer()
		}
		.padding()
		.navigationBarTitleDisplayMode(.inline)
		.onReceive(viewModel.timer) { _ in
			withAnimation {
				viewModel.nextElement(country: country)
			}
		}
    }
}

#Preview {
	CountryDetailView(country: .mock)
}
