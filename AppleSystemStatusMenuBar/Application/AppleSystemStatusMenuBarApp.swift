//
//  AppleSystemStatusMenuBarApp.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/04.
//

import SwiftUI

@main
struct AppleSystemStatusMenuBarApp: App {
    var body: some Scene {
        WindowGroup(id: "0011") {
            SettingView()
        }

        MenuBarExtra {
            ContentView(viewModel: AppViewModel(repository: AppleRepositoryImpl()))
        } label: {
            Image(systemName: "apple.logo")
        }
        .menuBarExtraStyle(.window)
    }
}
