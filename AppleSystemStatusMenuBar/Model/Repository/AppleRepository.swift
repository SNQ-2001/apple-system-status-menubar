//
//  Repository.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/07.
//

import Combine
import Foundation

protocol AppleRepository {
    func fetchAppleSystemStatus() -> AnyPublisher<AppleSystemStatus, Error>
}

class AppleRepositoryImpl: AppleRepository {
    func fetchAppleSystemStatus() -> AnyPublisher<AppleSystemStatus, Error> {
        let endpoint = Endpoint(
            host: "www.apple.com",
            path: "/support/systemstatus/data/system_status_en_US.js",
            queryItems: []
        )
        guard let url = endpoint.url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        return APIClient.fetch(url: url)
    }
}

class AppleRepositoryMock: AppleRepository {
    func fetchAppleSystemStatus() -> AnyPublisher<AppleSystemStatus, Error> {
        Future { promise in
            promise(.success(.init(services: [
                .init(events: [], serviceName: "Mock-1"),
                .init(events: [], serviceName: "Mock-2"),
                .init(events: [], serviceName: "Mock-3"),
                .init(events: [], serviceName: "Mock-4"),
                .init(events: [], serviceName: "Mock-5")
            ])))
        }
        .eraseToAnyPublisher()
    }
}
