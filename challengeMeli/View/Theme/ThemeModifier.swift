//
//  ThemeModifier.swift
//  challengeMeli
//
//  Created by Pablo Poza on 23/03/2025.
//

import SwiftUI

struct HelpTextModifier: ViewModifier {
    @Environment(\.theme) var theme
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(theme.colors.primaryText)
            .multilineTextAlignment(.leading)
            .font(theme.fonts.help)
    }
}

extension View {
    func helpTextThemed() -> some View {
        self.modifier(HelpTextModifier())
    }
}

struct ButtontModifier: ViewModifier {
    @Environment(\.theme) var theme
    
    var isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .disabled(!isEnabled)
    }
}


extension Button {
    func buttonThemed(isEnabled: Bool = true) -> some View {
        self.modifier(ButtontModifier(isEnabled: isEnabled))
    }
}


struct TextButtontModifier: ViewModifier {
    @Environment(\.theme) var theme
    
    var isEnabled: Bool
    
    func body(content: Content) -> some View {
        content
            .font(theme.fonts.button)
            .padding()
            .background(isEnabled ? theme.colors.primaryComponent : theme.colors.disabledComponent)
            .foregroundColor(isEnabled ? theme.colors.enabledButtonText : theme.colors.disabledButtonText)            
            .cornerRadius(10)
            .disabled(!isEnabled)
    }
}

extension Text {
    func textButtonThemed(isEnabled: Bool = true) -> some View {
        self.modifier(TextButtontModifier(isEnabled: isEnabled))
    }
}


struct TextFieldModifier: ViewModifier {
    @Environment(\.theme) var theme
    
    func body(content: Content) -> some View {
        content.textFieldStyle(PlainTextFieldStyle())
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(15)
    }
}

extension TextField {
    func textFieldThemed(isEnabled: Bool = true) -> some View {
        self.modifier(TextFieldModifier())
    }
}




