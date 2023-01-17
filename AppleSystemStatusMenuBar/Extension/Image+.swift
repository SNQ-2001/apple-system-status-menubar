//
//  Image+.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import SwiftUI

extension Image {
    static let circle = Image(systemName: "circle.fill") // 緑色
    static let diamond = Image(systemName: "diamond.fill") // 黄色
    static let triangle = Image(systemName: "triangle.fill") // 赤色

    static let slider = Image(systemName: "slider.horizontal.3") // 環境設定
}

extension Image {
    static func statusIcon(status: StatusType) -> Image {
        switch status {
        case .default:
            return .circle
        case .maintenance:
            return .circle
        case .issue:
            return .diamond
        case .outage:
            return .triangle
        }
    }
}
