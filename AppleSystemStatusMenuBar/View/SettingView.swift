//
//  SettingView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/08.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        TabView {
            Text("General")
                .tabItem {
                    Label("General", systemImage: "gear")
                }
            Text("License")
                .tabItem {
                    Label("License", systemImage: "book")
                }
        }
        .frame(width: 300, height: 300)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
