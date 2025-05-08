//
//  FormButton.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct FormButton: View {
    let title: String
    let onPress: () -> Void
    var body: some View {
        Button {
            onPress()
        } label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
        }
        .buttonStyle(.borderedProminent)
        .tint(.purple)
    }
}

#Preview {
    FormButton(title: "Login", onPress: {})
}
