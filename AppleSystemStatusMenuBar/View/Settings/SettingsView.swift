//
//  SettingsView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/08.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel: SettingsViewModel

    init(viewModel: SettingsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        TabView {
            GeneralView(viewModel: viewModel)
                .tabItem { Label("General", systemImage: "gear") }
            LicenseView()
                .tabItem { Label("License", systemImage: "book") }
        }
        .frame(width: 350, height: 300)
    }
}
