//
//  Endpoint.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Foundation
import SwiftUI

struct Endpoint {
    let scheme: String
    let host: String
    let path: String
    let queryItems: [URLQueryItem]

    init(scheme: String = "https", host: String = "www.apple.com", path: String, queryItems: [URLQueryItem] = []) {
        self.scheme = scheme
        self.host = host
        self.path = path
        self.queryItems = queryItems
    }
}

extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = host
        components.path = path
        components.queryItems = queryItems
        return components.url
    }
}
