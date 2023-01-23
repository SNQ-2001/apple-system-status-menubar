//
//  APIClient.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Combine
import Foundation

class APIClient {
    static func fetch<T>(url: URL) -> AnyPublisher<T, Error> where T: Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}
