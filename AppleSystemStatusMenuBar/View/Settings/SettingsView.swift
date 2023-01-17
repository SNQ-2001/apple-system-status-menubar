//
//  SettingsView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/08.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
            LicenseView()
                .tabItem {
                    Label("License", systemImage: "book")
                }
        }
        .frame(width: 300, height: 300)
    }
}
