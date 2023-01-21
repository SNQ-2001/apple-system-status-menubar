//
//  Color+.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/17
//
//

import SwiftUI

extension Color {
    static func statusColor(statusType: StatusType, eventStatus: EventStatus) -> Color {
        switch statusType {
        case .default:
            return .green
        case .maintenance:
            return .green
        case .issue:
            return eventStatus == .ongoing ? .yellow : .green
        case .outage:
            return eventStatus == .ongoing ? .red : .green
        }
    }
}
