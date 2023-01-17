//
//  Color+.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/17
//
//

import SwiftUI

extension Color {
    static func statusColor(status: StatusType) -> Color {
        switch status {
        case .default:
            return .green
        case .maintenance:
            return .green
        case .issue:
            return .yellow
        case .outage:
            return .red
        }
    }
}
