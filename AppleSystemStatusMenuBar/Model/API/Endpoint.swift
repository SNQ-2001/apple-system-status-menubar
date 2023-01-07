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
}

extension Endpoint {
    static func systemstatus() -> Endpoint {
        Endpoint(
            scheme: "https",
            host: "www.apple.com",
            path: "/support/systemstatus/data/system_status_en_EM.js",
            queryItems: []
        )
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
