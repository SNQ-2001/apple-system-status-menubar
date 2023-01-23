//
//  Repository.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/07.
//

import Combine
import Foundation

protocol AppleRepository {
    func fetchAppleSystemStatus(localeName: String) -> AnyPublisher<AppleSystemStatus, Error>
    func fetchAppleDeveloperSystemStatus() -> AnyPublisher<AppleDeveloperSystemStatus, Error>
}

class AppleRepositoryImpl: AppleRepository {
    func fetchAppleSystemStatus(localeName: String) -> AnyPublisher<AppleSystemStatus, Error> {
        let endpoint = Endpoint(
            host: "www.apple.com",
            path: "/support/systemstatus/data/system_status_\(localeName).js",
            queryItems: []
        )
        guard let url = endpoint.url else { return Fail(error: URLError(.badURL)).eraseToAnyPublisher() }
        return APIClient.fetch(url: url)
    }

    func fetchAppleDeveloperSystemStatus() -> AnyPublisher<AppleDeveloperSystemStatus, Error> {
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
    func fetchAppleSystemStatus(localeName _: String) -> AnyPublisher<AppleSystemStatus, Error> {
        Future { promise in
            promise(.success(.init(services: [
                .init(redirectUrl: nil, events: [], serviceName: "Mock-1-AppleSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-2-AppleSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-3-AppleSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-4-AppleSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-5-AppleSystemStatus")
            ])))
        }
        .eraseToAnyPublisher()
    }

    func fetchAppleDeveloperSystemStatus() -> AnyPublisher<AppleDeveloperSystemStatus, Error> {
        Future { promise in
            promise(.success(.init(services: [
                .init(redirectUrl: nil, events: [], serviceName: "Mock-1-AppleDeveloperSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-2-AppleDeveloperSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-3-AppleDeveloperSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-4-AppleDeveloperSystemStatus"),
                .init(redirectUrl: nil, events: [], serviceName: "Mock-5-AppleDeveloperSystemStatus")
            ])))
        }
        .eraseToAnyPublisher()
    }
}
