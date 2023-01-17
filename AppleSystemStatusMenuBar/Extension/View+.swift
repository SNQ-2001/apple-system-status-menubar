//
//  View+.swift
//  AppleSystemStatusMenuBar
//
//  Created by TAISHIN MIYAMOTO on 2023/01/17
//
//

import SwiftUI

extension View {
    @ViewBuilder
    func hidden(isHidden: Bool) -> some View {
        if isHidden {
            hidden()
        } else {
            self
        }
    }
}
