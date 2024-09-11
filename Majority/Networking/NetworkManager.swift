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
		urlString: String,
		httpMethod: String = "GET",
		uploadData: Data? = nil,
		session: URLSession = .shared
	) -> AnyPublisher<T, Error> {
		//convert url string to url
		let url = URL(string: urlString)!

		//setup url request
		var request = URLRequest(url: url)
		request.httpMethod = httpMethod
		request.httpBody = uploadData

		// make the call using the url request
		return session
			.dataTaskPublisher(for: request)
			.tryMap { $0.data }
			.decode(type: T.self, decoder: JSONDecoder())
			.eraseToAnyPublisher()
	}
}
