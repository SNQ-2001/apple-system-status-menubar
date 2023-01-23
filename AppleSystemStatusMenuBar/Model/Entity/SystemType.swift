//
//  SystemType.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

// MARK: SystemType

enum SystemType {
    case appleSystem([Service])
    case appleDeveloperSystem([Service])

    var title: String {
        switch self {
        case .appleSystem:
            return "Apple System Status"
        case .appleDeveloperSystem:
            return "Apple Developer System Status"
        }
    }
}
