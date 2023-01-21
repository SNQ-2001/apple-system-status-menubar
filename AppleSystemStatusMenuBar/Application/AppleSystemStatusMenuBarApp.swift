//
//  AppleSystemStatusMenuBarApp.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import SwiftUI

@main
struct AppleSystemStatusMenuBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        MenuBarExtra {
            SystemStatusView(viewModel: .init(repository: AppleRepositoryImpl()), delegate: delegate)
        } label: {
            Image(systemName: "circle.dashed.inset.filled")
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingsView(viewModel: .init())
        }
    }
}
