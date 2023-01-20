//
//  ContentView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import Combine
import SwiftUI

struct SystemStatusView: View {
    @StateObject var viewModel: AppViewModel

    @ObservedObject var delegate: AppDelegate

    init(viewModel: AppViewModel, delegate: AppDelegate) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.delegate = delegate
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List(viewModel.appleSystemStatus.services, id: \.serviceName) { service in
                    serviceStatusCellView(for: service)
                }
                .listStyle(.bordered(alternatesRowBackgrounds: true))

                HStack(spacing: 0) {
                    settingsButton()

                    Spacer()

                    quitButton()
                }
                .padding(.all, 7)
            }
            .navigationTitle("Apple System Status")
        }
        .frame(width: 250, height: 500)
    }
}

extension SystemStatusView {
    private func settingsButton() -> some View {
        Label {
            Text("環境設定")
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
            Text("終了")
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

    private func serviceStatusCellLabel(for service: Service) -> some View {
        let isEvents = !service.events.isEmpty
        return Label {
            Text(service.serviceName)
        } icon: {
            Image.statusIcon(status: isEvents ? service.events[0].statusType : .default)
        }
        .labelStyle(.list(
            statusType: isEvents ? service.events[0].statusType : .default,
            isEvents: isEvents
        ))
    }

    @ViewBuilder
    private func serviceStatusCellView(for service: Service) -> some View {
        let isEvents = !service.events.isEmpty
        if isEvents {
            NavigationLink {
                SystemStatusDetailView(serviceName: service.serviceName, event: service.events[0])
            } label: {
                serviceStatusCellLabel(for: service)
            }
        } else {
            serviceStatusCellLabel(for: service)
        }
    }
}
