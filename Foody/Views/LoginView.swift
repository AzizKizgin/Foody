//
//  LoginView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var shouldRemember: Bool = false
    @State var isChecked: Bool = false
    var body: some View {
        VStack {
            FormMessage(title: "Login", content: "Please sign in to your account")
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    TextInput(title: "Email", text: $email)
                    TextInput(title: "Password", text: $password)
                }
                HStack {
                    Checkbox(
                        isChecked: isChecked,
                        onCheck: {isChecked.toggle()
                        },
                        text: "Remember me")
                    Spacer()
                    NavigationLink {
                        Text("Forget Password")
                    } label: {
                        Text("Forgot Password?")
                    }
                }

                FormButton(title: "Login") {
                    
                }
                NavigationLink {
                    Text("Don't have an account? ")
                } label: {
                    Text("Don't have an account? SIGN UP")
                }
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity)
            .background(RoundedRectangle(cornerRadius: 20).fill(Color(.systemBackground)).ignoresSafeArea())
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(.accent)
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
