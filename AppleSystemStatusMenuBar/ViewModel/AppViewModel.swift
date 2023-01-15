//
//  AppViewModel.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/07.
//

import AppKit
import Combine
import Foundation

final class AppViewModel: ObservableObject {
    @Published var appleSystemStatus: AppleSystemStatus = .init(services: [])
    @Published var searchText: String = ""
    @Published var isSettingsButtonHover: Bool = false
    @Published var isQuitButtonHover: Bool = false

    private let repository: AppleRepository

    private var cancellable = Set<AnyCancellable>()

    var searchServiceResults: [Service] {
        if searchText.isEmpty {
            return appleSystemStatus.services
        } else {
            return appleSystemStatus.services.filter { $0.serviceName.localizedStandardContains(searchText) }
        }
    }

    init(repository: AppleRepository) {
        self.repository = repository

        NotificationCenter.default.publisher(for: NSWindow.didBecomeKeyNotification)
            .sink { [weak self] _ in
                guard let self else { return }
                self.getAppleSystemStatus()
            }
            .store(in: &cancellable)
    }

    private func getAppleSystemStatus() {
        repository.fetchAppleSystemStatus()
            .receive(on: DispatchQueue.main)
            .replaceError(with: .init(services: []))
            .assign(to: &$appleSystemStatus)
    }

    func quit() {
        NSApplication.shared.terminate(nil)
    }
}
