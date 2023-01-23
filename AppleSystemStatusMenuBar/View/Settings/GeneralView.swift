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
                VStack(spacing: 0) {
                    Text("Apple System Status".uppercased())
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.init(top: 0, leading: 1, bottom: 3, trailing: 0))
                    Picker("", selection: $viewModel.appleSystemLocaleName) {
                        ForEach(AppleSystemLocale.allCases, id: \.name) { locale in
                            Text(locale.country).tag(locale.name)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)

                    Divider().padding(.init(top: 8, leading: 0, bottom: 5, trailing: 0))

                    Text("Apple System System Status".uppercased())
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.init(top: 0, leading: 1, bottom: 3, trailing: 0))
                    Picker("", selection: $viewModel.appleDeveloperSystemLocaleName) {
                        ForEach(AppleDeveloperSystemLocale.allCases, id: \.name) { locale in
                            Text(locale.country).tag(locale.name)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.menu)
                }
                .padding(.vertical, 5)
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
