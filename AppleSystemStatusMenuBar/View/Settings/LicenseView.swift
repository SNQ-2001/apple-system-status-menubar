//
//  LicenseView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/16.
//

import SwiftUI

struct LicenseView: View {
    private let licenses: [License] = [
        .init(
            name: "SwiftLint",
            url: URL(string: "https://github.com/realm/SwiftLint")!
        ),
        .init(
            name: "SwiftFormat",
            url: URL(string: "https://github.com/nicklockwood/SwiftFormat")!
        )
    ]

    var body: some View {
        List(licenses, id: \.name) { license in
            licenseCell(name: license.name, url: license.url)
        }
        .listStyle(.bordered(alternatesRowBackgrounds: true))
    }

    private func licenseCell(
        name: String,
        url: URL
    ) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(name).font(.system(size: 20, weight: .bold, design: .default))

            Link(url.absoluteString, destination: url)
        }
        .padding(.vertical, 5)
    }
}
