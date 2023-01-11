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
            ContentView(viewModel: AppViewModel(repository: AppleRepositoryImpl()), delegate: delegate)
        } label: {
            Image(systemName: "apple.logo")
        }
        .menuBarExtraStyle(.window)

        Settings {
            SettingView()
        }
    }
}
