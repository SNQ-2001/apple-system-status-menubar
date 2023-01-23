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

// MARK: - Service

struct Service: Codable {
    let redirectUrl: String?
    var events: [Event]
    let serviceName: String
}

// MARK: - Event

struct Event: Codable {
    let usersAffected: String
    let epochStartDate: Double
    let epochEndDate: Double?
    let messageId: String
    let statusType: StatusType
    let datePosted: String?
    let startDate: String
    let endDate: String?
    let affectedServices: [String]?
    let eventStatus: EventStatus
    let message: String
}

enum EventStatus: String, Codable {
    case `default`
    case resolved
    case completed
    case ongoing
}

enum StatusType: String, Codable {
    case `default`
    case maintenance = "Maintenance"
    case issue = "Issue"
    case outage = "Outage"
}

extension AppleSystemStatus {
    static var empty: Self {
        .init(services: [])
    }
}
