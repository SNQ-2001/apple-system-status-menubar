//
//  SettingsViewModel.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/22
//
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("appleSystemLocaleName") var appleSystemLocaleName: String = AppleSystemLocale.english.name
    // swiftlint: disable line_length
    @AppStorage("appleDeveloperSystemLocaleName") var appleDeveloperSystemLocaleName: String = AppleDeveloperSystemLocale.english.name
}
