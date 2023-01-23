//
//  Event.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: - Event

struct Event: Codable {
    let usersAffected: String
    let epochStartDate: Double
    let epochEndDate: Double?
    let statusType: StatusType
    let affectedServices: [String]?
    let eventStatus: EventStatus
    let message: String
}
