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
            .map {
                guard var dataString = String(data: $0, encoding: .utf8) else { return .init() }
                dataString = dataString.replacingOccurrences(of: "jsonCallback(", with: "")
                dataString = dataString.replacingOccurrences(of: ");", with: "")
                guard let data = dataString.data(using: .utf8) else { return .init() }
                return data
            }
            .decode(type: T.self, decoder: decoder)
            .receive(on: DispatchQueue.global())
            .eraseToAnyPublisher()
    }
}
