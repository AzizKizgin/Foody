//
//  LoginView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel: LoginViewModel
    @AppStorage("isLogin") private var islogin = false
    init() {
        let service = DIContainer.shared.container.resolve(
            AuthServiceProtocol.self
        )!
        _viewModel = StateObject(wrappedValue: LoginViewModel(service: service))
    }
    var body: some View {
        VStack {
            FormMessage(title: "Login", content: "Please sign in to your account")
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    TextInput(title: "Email", text: $viewModel.info.email)
                    TextInput(title: "Password", text: $viewModel.info.password)
                }
                HStack {
                    Checkbox(
                        isChecked: viewModel.shouldRemember,
                        onCheck: {viewModel.shouldRemember.toggle()},
                        text: "Remember me")
                    Spacer()
                }

                FormButton(title: "Login") {
                    viewModel.login { user in
                        if user != nil {
                            islogin = true
                        }
                    }
                }
                NavigationLink {
                    RegisterView()
                } label: {
                    Text("Don't have an account? SIGN UP")
                }
                Spacer()
            }
            .padding()
            .frame(maxHeight: .infinity)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .alert(
            viewModel.errorMessage,
            isPresented: $viewModel.showError) {
                Button("Ok") {
                    
                }
            }
    }
}

#Preview {
    NavigationStack {
        LoginView()
    }
}
