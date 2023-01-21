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
        VStack(spacing: 15) {
            GroupBox {
                Picker(selection: $viewModel.localeName) {
                    ForEach(Locale.allCases, id: \.name) { locale in
                        Text(locale.country).tag(locale.name)
                    }
                } label: {
                    Text("Country")
                }
                .padding(.vertical, 10)
            }

            HStack(spacing: 10) {
                Button {
                    let url = URL(string: "https://twitter.com/SNQ2001")!
                    NSWorkspace.shared.open(url)
                } label: {
                    Text("Twitter")
                }
                .buttonStyle(.bordered)

                Button {
                    let url = URL(string: "https://github.com/SNQ-2001")!
                    NSWorkspace.shared.open(url)
                } label: {
                    Text("GitHub")
                }
                .buttonStyle(.bordered)
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding()
    }
}
