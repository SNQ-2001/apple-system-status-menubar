//
//  AppleSystemStatus.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Foundation

// MARK: - AppleSystemStatus

struct AppleSystemStatus: Codable {
    let services: [Service]
}

extension AppleSystemStatus {
    static var empty: Self {
        .init(services: [])
    }
}
