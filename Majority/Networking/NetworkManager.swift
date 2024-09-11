//
//  NetworkManager.swift
//  Majority
//
//  Created by Yugantar Jain on 08/09/24.
//

import Foundation
import Combine

struct NetworkManager {
	static func callAPI<T: Decodable>(
		endpoint: Endpoint,
		session: URLSession
	) -> AnyPublisher<T, Error> {
		//convert url string to url
		let urlString = endpoint.baseURL + endpoint.path
		guard let url = URL(string: urlString) else {
			return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
		}

		//setup url request
		var request = URLRequest(url: url)
		request.httpMethod = endpoint.httpMethod.rawValue
		request.httpBody = endpoint.uploadData


		// make the call using the url request
		return session
			.dataTaskPublisher(for: request)
			.tryMap { $0.data }
			.decode(type: T.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}
