//
//  CountryDetailSegmentView.swift
//  Majority
//
//  Created by Yugantar Jain on 11/09/24.
//

import SwiftUI

struct CountryDetailSegmentView: View {
	let country: Country
	let type: CountryDetailType

    var body: some View {
		if let detail = type.detail(country: country) {
			GroupBox {
				HStack {
					Text(detail)
					Spacer()
				}
			} label: {
				Label(type.title, systemImage: type.icon)
			}
		}
    }
}

#Preview {
	CountryDetailSegmentView(country: .mock, type: .capital)
}
