//
//  SettingsViewModel.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/22
//
//

import SwiftUI

final class SettingsViewModel: ObservableObject {
    @AppStorage("localeName") var localeName: String = Locale.english.name
}
