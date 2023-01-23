//
//  AppleSystemLocale.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/22
//
//

import Foundation

enum AppleSystemLocale {
    case english
    case china
    case japan
    case korea
    case german
    case spanish
    case french
    case italia
    case portugal
    case russia
}

extension AppleSystemLocale {
    var country: String {
        switch self {
        case .english: return "USA"
        case .china: return "China"
        case .japan: return "Japan"
        case .korea: return "South Korea"
        case .german: return "Germany"
        case .spanish: return "Spain"
        case .french: return "France"
        case .italia: return "Italy"
        case .portugal: return "Portugal"
        case .russia: return "Russia"
        }
    }

    var name: String {
        switch self {
        case .english: return "en_US"
        case .china: return "zh_CN"
        case .japan: return "ja_JP"
        case .korea: return "ko_KR"
        case .german: return "de_DE"
        case .spanish: return "es_ES"
        case .french: return "fr_FR"
        case .italia: return "it_IT"
        case .portugal: return "pt_BR"
        case .russia: return "ru_RU"
        }
    }
}

extension AppleSystemLocale: CaseIterable {}
