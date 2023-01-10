//
//  ListLabelStyle.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/08.
//

import SwiftUI

struct ListLabelStyle: LabelStyle {
    let iconColor: Color
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 5) {
            configuration.icon
                .foregroundColor(iconColor)
                .font(.system(size: 12, weight: .medium, design: .default))
                .dynamicTypeSize(.medium)
            configuration.title
                .foregroundColor(.primary)
                .font(.system(size: 12, weight: .medium, design: .default))
                .dynamicTypeSize(.medium)
        }
    }
}

extension LabelStyle where Self == ListLabelStyle {
    static func list(iconColor: Color) -> ListLabelStyle {
        .init(iconColor: iconColor)
    }
}
