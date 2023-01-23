//
//  StatusType.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: StatusType

enum StatusType: String, Codable {
    case `default`
    case maintenance = "Maintenance"
    case issue = "Issue"
    case outage = "Outage"
}
