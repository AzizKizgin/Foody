//
//  HomeView.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel? = nil) {
        if let viewModel = viewModel {
            _viewModel = StateObject(wrappedValue: viewModel)
        } else {
            let service = DIContainer.shared.container.resolve(
                FoodServiceProtocol.self
            )!
            _viewModel = StateObject(wrappedValue: HomeViewModel(service: service))
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible()),
                GridItem(.flexible())
            ], spacing: 8) {
                ForEach(viewModel.categories) { category in
                    VStack {
                        let fixedUrl = category.image.replacingOccurrences(
                            of: "\\/",
                            with: "/"
                        )
                        
                        AsyncImage(url: URL(string: fixedUrl)) { phase in
                            switch phase {
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        maxHeight: .infinity
                                    )
                            default:
                                Image("placeholder")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(
                                        maxHeight: .infinity
                                    )
                            }
                        }
                        Text(category.name)
                            .padding(.vertical, 10)
                    }
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                    )
                    .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 0, y: 2)
                    .padding(10)
                }
            }
        }
        .onAppear {
            viewModel.getAllCategories()
        }
    } 
}

#Preview {
    let vm = HomeViewModel(service: MockFoodService())
    HomeView(viewModel: vm)
}
