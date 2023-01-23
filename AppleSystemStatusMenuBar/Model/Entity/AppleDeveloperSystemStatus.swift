//
//  AppleDeveloperSystemStatus.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: - AppleDeveloperSystemStatus

struct AppleDeveloperSystemStatus: Codable {
    let services: [Service]
}

extension AppleDeveloperSystemStatus {
    static var empty: Self {
        .init(services: [])
    }
}
