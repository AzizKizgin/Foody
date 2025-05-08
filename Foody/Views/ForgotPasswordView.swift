//
//  ForgotPasswordView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    var body: some View {
        VStack {
            FormMessage(title: "Reset Password", content: "Please enter your email to reset password")
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    TextInput(title: "Email", text: $email)
                }
                FormButton(title: "Reset Password") {
                    
                }
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}

#Preview {
    ForgotPasswordView()
}
