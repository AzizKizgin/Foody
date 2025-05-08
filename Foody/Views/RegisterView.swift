//
//  RegisterView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: RegisterViewModel
    init() {
        let service = DIContainer.shared.container.resolve(
            AuthServiceProtocol.self
        )!
        _viewModel = StateObject(wrappedValue: RegisterViewModel(service: service))
    }
   
    var body: some View {
        VStack {
            FormMessage(title: "Signup", content: "Please sign up to get started")
            Spacer()
            VStack(spacing: 20) {
                VStack {
                    TextInput(title: "Name", text: $viewModel.info.name)
                    TextInput(title: "Email", text: $viewModel.info.email)
                    TextInput(title: "Password", text: $viewModel.info.password)
                    TextInput(title: "Confirm Password", text: $viewModel.info.confirmPassword)
                }

                FormButton(title: "Sign Up") {
                    viewModel.register { user in
                        if user != nil {
                            dismiss()
                        }
                    }
                }
            }
            .padding()
            .frame(maxHeight: .infinity)
            
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .alert(
            viewModel.errorMessage,
            isPresented: $viewModel.showError) {
                Button("Ok") {}
        }
    }
}

#Preview {
    RegisterView()
}
