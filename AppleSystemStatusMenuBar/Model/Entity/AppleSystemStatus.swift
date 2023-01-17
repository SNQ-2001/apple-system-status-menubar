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
    let messageID: String
    let statusType: StatusType
    let datePosted: String?
    let startDate: String
    let endDate: String?
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
    // MARK: resolvedとcompletedの違いがわからない

    case resolved // 解決済み 緑色
    case completed // ？？完了 緑色
    case ongoing // 進行中 StatusTypeの色
}

enum StatusType: String, Codable {
    case `default` // 問題なし　緑色
    case maintenance = "Maintenance" // メンテナンス　緑色
    case issue = "Issue" // 問題　黄色
    case outage = "Outage" // 停電　赤色
}

extension AppleSystemStatus {
    static var empty: Self {
        .init(services: [])
    }
}
