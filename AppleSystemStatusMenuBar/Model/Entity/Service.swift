//
//  Service.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: - Service

struct Service: Codable {
    let redirectUrl: String?
    var events: [Event]
    let serviceName: String
}
