//
//  TextInput.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct TextInput: View {
    let title: String
    @Binding var text: String
    var isSecure: Bool = false

    @State private var isPasswordVisible = false

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)

            ZStack(alignment: .trailing) {
                Group {
                    if isSecure && !isPasswordVisible {
                        SecureField(title, text: $text)
                    } else {
                        TextField(title, text: $text)
                    }
                }
                .padding()
                .background(Color.accent.opacity(0.2))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.accent, lineWidth: 1)
                )

                if isSecure {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                            .foregroundColor(.gray)
                            .padding(.trailing, 12)
                    }
                }
            }
        }
    }
}


#Preview {
    TextInput(title: "Email", text: .constant("pasword"),isSecure: true)
}
