//
//  AppViewModel.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/07.
//

import AppKit
import Combine
import Foundation
import SwiftUI

final class SystemStatuViewModel: ObservableObject {
    @Published var appleSystemStatus: AppleSystemStatus = .init(services: [])
    @Published var isSettingsButtonHover: Bool = false
    @Published var isQuitButtonHover: Bool = false

    @AppStorage("localeName") var localeName: String = Locale.english.name

    private let repository: AppleRepository

    private var cancellable = Set<AnyCancellable>()

    init(repository: AppleRepository) {
        self.repository = repository

        NotificationCenter.default.publisher(for: NSWindow.didBecomeKeyNotification)
            .sink { [weak self] _ in
                guard let self else { return }
                self.appleSystemStatus = .empty
                self.getAppleSystemStatus()
            }
            .store(in: &cancellable)
    }

    private func getAppleSystemStatus() {
        repository.fetchAppleSystemStatus(localeName: localeName)
            .receive(on: DispatchQueue.main)
            .replaceError(with: .init(services: [.init(redirectUrl: nil, events: [], serviceName: "Error")]))
            .sink { [weak self] appleSystemStatus in
                guard let self else { return }
                withAnimation { self.appleSystemStatus = appleSystemStatus }
            }
            .store(in: &cancellable)
    }

    func quit() {
        NSApplication.shared.terminate(nil)
    }
}