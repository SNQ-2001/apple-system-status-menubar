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

    var body: some View {
        List {
            Section {
                Text(event.statusType.rawValue)
            } header: {
                Text("Status")
            }

            Section {
                Text(event.eventStatus.rawValue)
            } header: {
                Text("Event status")
            }

            Section {
                Text(event.startDate)
            } header: {
                Text("Event started")
            }

            if event.endDate != nil {
                Section {
                    Text(event.endDate?.description ?? "no data")
                } header: {
                    Text("Event ended")
                }
            }

            Section {
                Text(event.usersAffected)
            } header: {
                Text("Users affected")
            }

            if event.affectedServices != nil {
                Section {
                    ForEach(event.affectedServices ?? [], id: \.self) { affectedService in
                        Text(affectedService)
                    }
                } header: {
                    Text("Services affected")
                }
            }

            Section {
                Text(event.message)
            } header: {
                Text("Message")
            }
        }
        .listStyle(.sidebar)
        .navigationTitle(serviceName)
    }
}
