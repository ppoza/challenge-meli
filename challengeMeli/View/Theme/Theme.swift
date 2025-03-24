//
//  Theme.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

import SwiftUI

struct Theme {
    var fonts: Fonts
    var colors: Colors
}

struct Colors {
    var primaryText: Color
    var secondaryText: Color
    
    var enabledButtonText: Color
    var disabledButtonText: Color
    
    var primaryComponent: Color
    var disabledComponent: Color
}

struct Fonts {
    var help: Font
    var button: Font
}

let baseTheme = Theme(
        fonts: Fonts(help: .caption, button: .headline),
        colors: Colors(primaryText: .primary,
                       secondaryText: .secondary,
                       enabledButtonText: .white,
                       disabledButtonText: .white,
                       primaryComponent: .blue,
                       disabledComponent: .gray)
)


struct ThemeKey: EnvironmentKey {
    typealias Value = Theme    
    static let defaultValue = baseTheme
}


extension EnvironmentValues {
    var theme: Theme {
        get { self[ThemeKey.self] }
        set { self[ThemeKey.self] = newValue }
    }
}


