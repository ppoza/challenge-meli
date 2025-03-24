//
//  View+Extension.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

import SwiftUI

struct RunOnceOnAppear: ViewModifier {
    @State private var hasAppeared = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content.onAppear {
            if !hasAppeared {
                action()
                hasAppeared = true
            }
        }
    }
}

extension View {
    func runOnceOnAppear(perform action: @escaping () -> Void) -> some View {
        self.modifier(RunOnceOnAppear(action: action))
    }
}
