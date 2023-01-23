//
//  AppleDeveloperSystemLocale.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/23
//
//

import Foundation

enum AppleDeveloperSystemLocale {
    case english
}

extension AppleDeveloperSystemLocale {
    var country: String {
        switch self {
        case .english: return "USA"
        }
    }

    var name: String {
        switch self {
        case .english: return "en_US"
        }
    }
}

extension AppleDeveloperSystemLocale: CaseIterable {}
