//
//  CountriesEndpoint.swift
//  Majority
//
//  Created by Yugantar Jain on 12/09/24.
//

import Foundation

struct GetCountriesEndpoint: Endpoint {
	var path: String {
		"/all"
	}

	var httpMethod: HTTPMethod {
		.get
	}
}
