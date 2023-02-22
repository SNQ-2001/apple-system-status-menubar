//
//  Image+.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import SwiftUI

extension Image {
    static let circle = Image(systemName: "circle.fill")
    static let diamond = Image(systemName: "diamond.fill")
    static let triangle = Image(systemName: "triangle.fill")
    static let slider = Image(systemName: "slider.horizontal.3")
}

extension Image {
    static func statusIcon(statusType: StatusType, eventStatus: EventStatus) -> Image {
        switch statusType {
        case .default:
            return .circle
        case .maintenance:
            return .circle
        case .issue:
            return eventStatus == .ongoing ? .diamond : .circle
        case .outage:
            return eventStatus == .ongoing ? .triangle : .circle
        case .performance:
            return eventStatus == .ongoing ? .triangle : .circle
        }
    }
}
