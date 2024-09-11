//
//  Endpoint.swift
//  Majority
//
//  Created by Yugantar Jain on 12/09/24.
//

import Foundation

protocol Endpoint {
	var baseURL: String { get }
	var path: String { get }
	var httpMethod: HTTPMethod { get }
	var uploadData: Data? { get }
}

extension Endpoint {
	var baseURL: String {
		"https://restcountries.com/v3.1"
	}

	var uploadData: Data? {
		nil
	}
}
