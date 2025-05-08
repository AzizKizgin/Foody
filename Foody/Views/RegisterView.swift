//
//  RegisterView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var name: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    var body: some View {
        VStack {
            FormMessage(title: "Signup", content: "Please sign up to get started")
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    TextInput(title: "Name", text: $name)
                    TextInput(title: "Email", text: $email)
                    TextInput(title: "Password", text: $password)
                    TextInput(title: "Confirm Password", text: $confirmPassword)
                }

                FormButton(title: "Sign Up") {
                    
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)).ignoresSafeArea())
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.purple)
    }
}

#Preview {
    RegisterView()
}
