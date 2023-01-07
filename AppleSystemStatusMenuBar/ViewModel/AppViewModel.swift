//
//  AppViewModel.swift
//  AppleSystemStatusMenuBar
//
//  Created by 宮本大新 on 2023/01/07.
//

import Combine
import Foundation

final class AppViewModel: ObservableObject {
    @Published var status: AppleSystemStatus = .init(services: [])

    private let repository: AppleRepository
    
    var cancellable = Set<AnyCancellable>()

    init(repository: AppleRepository) {
        self.repository = repository

        $status
            .sink { appleSystemStatus in
                print(appleSystemStatus)
            }
            .store(in: &cancellable)
    }

    func getAppleSystemStatus() {
        repository.fetchAppleSystemStatus()
            .replaceError(with: .init(services: []))
            .assign(to: &$status)
    }
}
