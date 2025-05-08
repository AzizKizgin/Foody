//
//  FormMessage.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct FormMessage: View {
    let title: String
    let content: String
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .bold()
            Text(content)
        }
        .foregroundStyle(.white)
        .frame(height: 250)
    }
}

#Preview {
    FormMessage(title: "Login", content: "Please sign in to your account")
}
