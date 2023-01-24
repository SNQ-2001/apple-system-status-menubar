//
//  SystemStatusDetailView.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/17
//
//

import SwiftUI

struct SystemStatusDetailView: View {
    private let serviceName: String

    private let event: Event

    init(serviceName: String, event: Event) {
        self.serviceName = serviceName
        self.event = event
    }

    private var startDate: String {
        Date(timeIntervalSince1970: event.epochStartDate / 1000)
            .formatted(date: .numeric, time: .standard)
            .localizedCapitalized
    }

    private var endDate: String {
        guard let epochEndDate = event.epochEndDate else { return "" }
        return Date(timeIntervalSince1970: epochEndDate / 1000)
            .formatted(date: .numeric, time: .standard)
            .localizedCapitalized
    }

    var body: some View {
        List {
            Section {
                Text(event.statusType.rawValue)
                    .lineLimit(nil)
            } header: {
                Text("Status")
            }
            .fixedSize(horizontal: false, vertical: true)

            Section {
                Text(event.eventStatus.rawValue)
                    .lineLimit(nil)
            } header: {
                Text("Event status")
            }
            .fixedSize(horizontal: false, vertical: true)

            section(label: "Event started") {
                Text(startDate).lineLimit(nil)
            }

            if event.epochEndDate != nil {
                section(label: "Event ended") {
                    Text(endDate).lineLimit(nil)
                }
            }

            section(label: "Users affected") {
                Text(event.usersAffected).lineLimit(nil)
            }

            if event.affectedServices != nil {
                section(label: "Services affected") {
                    ForEach(event.affectedServices ?? [], id: \.self) { affectedService in
                        Text(affectedService ?? "").lineLimit(nil)
                    }
                }
            }

            section(label: "Message") {
                Text(event.message).lineLimit(nil)
            }
        }
        .listStyle(.sidebar)
        .navigationTitle(serviceName)
    }

    private func section(label: String, @ViewBuilder content: () -> some View) -> some View {
        Section {
            content()
        } header: {
            Text(label)
        }
        .fixedSize(horizontal: false, vertical: true)
    }
}
