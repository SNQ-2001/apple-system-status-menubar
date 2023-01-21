//
//  ListLabelStyle.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/08.
//

import SwiftUI

struct ListLabelStyle: LabelStyle {
    let statusType: StatusType
    let eventStatus: EventStatus
    let isEvents: Bool

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 5) {
            configuration.icon
                .foregroundColor(.statusColor(statusType: statusType, eventStatus: eventStatus))
                .font(.system(size: 12, weight: .medium, design: .default))
                .dynamicTypeSize(.medium)

            configuration.title
                .foregroundColor(.primary)
                .font(.system(size: 12, weight: .medium, design: .default))
                .dynamicTypeSize(.medium)

            Spacer()

            disclosureIndicator()
        }
    }

    @ViewBuilder
    private func disclosureIndicator() -> some View {
        if isEvents {
            Image(systemName: "chevron.forward")
                .foregroundColor(.secondary)
                .font(.system(size: 12, weight: .bold, design: .default))
                .dynamicTypeSize(.medium)
        }
    }
}

extension LabelStyle where Self == ListLabelStyle {
    static func list(
        statusType: StatusType,
        eventStatus: EventStatus,
        isEvents: Bool
    ) -> ListLabelStyle {
        .init(
            statusType: statusType,
            eventStatus: eventStatus,
            isEvents: isEvents
        )
    }
}
