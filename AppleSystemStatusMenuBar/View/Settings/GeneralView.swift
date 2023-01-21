//
//  GeneralView.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/16.
//

import SwiftUI

struct GeneralView: View {
    @ObservedObject private var viewModel: SettingsViewModel

    init(viewModel: SettingsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            Picker(selection: $viewModel.localeName) {
                ForEach(Locale.allCases, id: \.name) { locale in
                    Text(locale.country).tag(locale.name)
                }
            } label: {
                Text("Country")
            }
        }
        .padding()
    }
}
