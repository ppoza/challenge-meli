//
//  MessageView.swift
//  challengeMeli
//
//  Created by Pablo Poza on 13/04/2025.
//

import SwiftUICore
import SwiftUI

enum MessageType {
    case error
    case warning
    case success
    case info
}

struct MessageView: View {
    let message: LocalizedStringKey
    let type: MessageType
    
    private var iconName: String {
        switch type {
            case .error: return "xmark.circle.fill"
            case .warning: return "exclamationmark.triangle.fill"
            case .success: return "checkmark.circle.fill"
            case .info: return "info.circle.fill"
        }
    }
    
    private var iconColor: Color {
        switch type {
            case .error: return .red
            case .warning: return .yellow
            case .success: return .green
            case .info: return .blue
        }
    }
    
    private var backgroundColor: Color {
        switch type {
            case .error: return .red.opacity(0.1)
            case .warning: return .yellow.opacity(0.1)
            case .success: return .green.opacity(0.1)
            case .info: return .blue.opacity(0.1)
        }
    }
    
    private var textColor: Color {
        switch type {
            case .error: return .red
            case .warning: return .yellow
            case .success: return .green
            case .info: return .blue
        }
    }
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: iconName)
                .symbolRenderingMode(.multicolor)
                .foregroundColor(iconColor)
                .font(.title3)
            
            Text(message)
                .foregroundColor(.primary)
                .font(.body)
                .multilineTextAlignment(.leading)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(iconColor.opacity(0.3), lineWidth: 1)
        )
    }
}

#Preview {
    MessageView(message: "Ejemplo de mensaje de error", type: .error)
    MessageView(message: "Ejemplo de mensaje de advertencia", type: .warning)
    MessageView(message: "Operación finalizada correctamente", type: .success)
    MessageView(message: "Mensaje de información", type: .info)
}
