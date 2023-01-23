//
//  ContentView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Combine
import SwiftUI

struct SystemStatusView: View {
    @StateObject var viewModel: SystemStatuViewModel

    @ObservedObject var delegate: AppDelegate

    init(viewModel: SystemStatuViewModel, delegate: AppDelegate) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.delegate = delegate
    }

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                appleSystemStatusList(systemType: .appleSystem(viewModel.appleSystemStatus.services))

                appleSystemStatusList(systemType: .appleDeveloperSystem(viewModel.appleDeveloperSystemStatus.services))
            }

            HStack(spacing: 0) {
                preferencesButton()

                Spacer()

                quitButton()
            }
            .padding(.all, 7)
        }
    }
}

extension SystemStatusView {
    private func preferencesButton() -> some View {
        Label {
            Text("Preferences")
                .foregroundColor(viewModel.isSettingsButtonHover ? .blue : .primary)
                .font(.system(size: 11, weight: .medium, design: .default))
        } icon: {
            Image.slider
                .foregroundColor(viewModel.isSettingsButtonHover ? .blue : .primary)
                .font(.system(size: 11, weight: .medium, design: .default))
        }
        .onHover { hovering in
            viewModel.isSettingsButtonHover = hovering
        }
        .onTapGesture {
            delegate.openPreferences()
        }
    }

    private func quitButton() -> some View {
        Label {
            Text("Quit")
                .foregroundColor(viewModel.isQuitButtonHover ? .blue : .primary)
                .font(.system(size: 11, weight: .medium, design: .default))
        } icon: {}
            .onHover { hovering in
                viewModel.isQuitButtonHover = hovering
            }
            .onTapGesture {
                viewModel.quit()
            }
    }

    private func appleSystemStatusCellLabel(for service: Service) -> some View {
        let isEvents = !service.events.isEmpty
        return Label {
            Text(service.serviceName)
        } icon: {
            Image.statusIcon(
                statusType: isEvents ? service.events[0].statusType : .default,
                eventStatus: isEvents ? service.events[0].eventStatus : .default
            )
        }
        .labelStyle(.list(
            statusType: isEvents ? service.events[0].statusType : .default,
            eventStatus: isEvents ? service.events[0].eventStatus : .default,
            isEvents: isEvents
        ))
    }

    @ViewBuilder
    private func appleSystemStatusCellView(for service: Service) -> some View {
        let isEvents = !service.events.isEmpty
        if isEvents {
            NavigationLink {
                SystemStatusDetailView(serviceName: service.serviceName, event: service.events[0])
            } label: {
                appleSystemStatusCellLabel(for: service)
            }
        } else {
            appleSystemStatusCellLabel(for: service)
        }
    }

    private func appleSystemStatusList(systemType: SystemType) -> some View {
        let services = viewModel.services(systemType: systemType)
        return NavigationStack {
            List(services, id: \.serviceName) { service in
                appleSystemStatusCellView(for: service)
            }
            .listStyle(.bordered(alternatesRowBackgrounds: true))
            .navigationTitle(systemType.title)
        }
        .frame(width: 250, height: 500)
    }
}
