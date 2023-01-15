//
//  AppDelegate.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/11.
//

import AppKit

class AppDelegate: NSObject, NSApplicationDelegate, ObservableObject {
    private var settingsWindow: NSWindow? {
        NSApp.windows.first(where: { window in
            window.frameAutosaveName == "com_apple_SwiftUI_Settings_window"
        })
    }

    func applicationDidFinishLaunching(_: Notification) {}

    func openPreferences() {
        if #available(macOS 13, *) {
            NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
        } else {
            NSApp.sendAction(Selector(("showPreferencesWindow:")), to: nil, from: nil)
        }
        guard let window = settingsWindow else { return }
        if window.canBecomeMain {
            window.orderFrontRegardless()
            window.center()
            NSApp.activate(ignoringOtherApps: true)
        }
    }
}
