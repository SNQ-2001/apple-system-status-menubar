//
//  EventStatus.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: EventStatus

enum EventStatus: String, Codable {
    case `default`
    case resolved
    case completed
    case ongoing
}
