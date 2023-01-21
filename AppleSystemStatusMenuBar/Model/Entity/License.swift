//
//  License.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/22
//
//

import Foundation

struct License {
    let name: String
    let url: URL
}

extension License {
    static let licenses: [License] = [
        .init(
            name: "SwiftLint",
            url: URL(string: "https://github.com/realm/SwiftLint")!
        ),
        .init(
            name: "SwiftFormat",
            url: URL(string: "https://github.com/nicklockwood/SwiftFormat")!
        )
    ]
}
