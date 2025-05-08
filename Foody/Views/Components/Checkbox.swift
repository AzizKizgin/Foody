//
//  Checkbox.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct Checkbox: View {
    let isChecked: Bool
    let onCheck: () -> Void
    let text: String
    var body: some View {
        HStack {
            Button {
                onCheck()
            } label: {
                Image(systemName: isChecked ? "checkmark.square.fill" : "square")
            }
            Text(text)
                .foregroundStyle(.accent)
        }
        .animation(.default, value: isChecked)
    }
}

#Preview {
    @Previewable @State var isChecked: Bool = false
    Checkbox(isChecked: isChecked, onCheck: {isChecked.toggle()}, text: "Remember me")
}
