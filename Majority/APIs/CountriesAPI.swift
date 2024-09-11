//
//  CountriesAPI.swift
//  Majority
//
//  Created by Yugantar Jain on 12/09/24.
//

import Foundation
import Combine

class CountriesAPI {
	private var cancellable: AnyCancellable?
	let urlSession: URLSession

	init(urlSession: URLSession = .shared) {
		self.urlSession = urlSession
	}

	func getCountries(completion: @escaping (Result<[CountriesResponse], Error>) -> Void) {
		self.cancellable = NetworkManager.callAPI(endpoint: GetCountriesEndpoint(), session: urlSession)
			.receive(on: RunLoop.main)
			.sink { result in
				switch result {
					case .finished:
						return

					case .failure(let error):
						completion(.failure(error))
				}
			} receiveValue: { countries in
				completion(.success(countries))
			}
	}

}
