//
//  ContentView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel: AppViewModel
    @State var isHover: Bool = false
    init(viewModel: AppViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    @Environment(\.openWindow) private var openWindow
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List(viewModel.searchServiceResults, id: \.serviceName) { service in
                    cell(for: service)
                }
                .listStyle(.bordered(alternatesRowBackgrounds: true))

                Label {
                    Text("環境設定")
                        .foregroundColor(isHover ? .blue : .primary)
                        .font(.system(size: 11, weight: .medium, design: .default))
                } icon: {
                    Image.slider
                        .foregroundColor(isHover ? .blue : .primary)
                        .font(.system(size: 11, weight: .medium, design: .default))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.all, 5)
                .onHover { hovering in
                    self.isHover = hovering
                }
                .onTapGesture {
                    openWindow(id: "0011")
                }
            }
            .navigationTitle("Apple System Status")
        }
        .frame(width: 250, height: 500)
    }

    private func cell(for service: Service) -> some View {
        Label {
            Text(service.serviceName)
        } icon: {
            Image.circle
        }
        .labelStyle(.list(iconColor: .green))
    }
}
