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
    let events: [Event]
    let serviceName: String
}

// MARK: - Event
struct Event: Codable {
    let usersAffected: String
    let epochStartDate, epochEndDate: Int
    let messageID: String
    let statusType: StatusType
    let datePosted: Date
    let startDate: Date
    let endDate: Date
    let affectedServices: [String]?
    let eventStatus: EventStatus
    let message: String

    enum CodingKeys: String, CodingKey {
        case usersAffected, epochStartDate, epochEndDate
        case messageID = "messageId"
        case statusType, datePosted, startDate, endDate, affectedServices, eventStatus, message
    }
}

enum EventStatus: String, Codable {
    case resolved = "resolved"
    case completed = "completed"
}

enum StatusType: String, Codable {
    case issue = "Issue"
    case outage = "Outage"
}
