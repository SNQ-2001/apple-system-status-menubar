//
//  APIClient.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Foundation
import Combine

protocol Request {
    associatedtype Response: Decodable
    var urlRequest: URLRequest { get }
}

// MARK: - APISession
protocol APISession {
    func dataTaskPublisher<R: Request>(for request: R) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}

// MARK: - APIClient
protocol APIClient {
    associatedtype Session: APISession
    var session: Session { get }
    func request<R: Request>(of request: R) -> AnyPublisher<R.Response, Error>
}

extension APIClient {
    func request<R: Request>(of request: R) -> AnyPublisher<R.Response, Error> {
        session
            .dataTaskPublisher(for: request)
            .tryMap { data, response in
                throw NSError()
            }
            .eraseToAnyPublisher()
    }
}

// MARK: - Mock
class MockAPIClient: APIClient {
    let session = MockAPISession()
}

class MockAPISession: APISession {
    func dataTaskPublisher<R: Request>(for request: R) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        MockDataTaskPublisher(request: request)
            .eraseToAnyPublisher()
    }
}

struct MockDataTaskPublisher<R: Request>: Publisher {
    typealias Output = (data: Data, response: URLResponse)
    typealias Failure = URLError

    let request: R

    func receive<S>(subscriber: S) where S : Subscriber, Self.Failure == S.Failure, Self.Output == S.Input {
        // something
    }
}
