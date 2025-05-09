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
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ], spacing: 8) {
                    ForEach(viewModel.categories) { category in
                        NavigationLink(value: category) {
                            CategoryItem(category: category)
                        }
                    }
                }
            }
            .navigationDestination(for: Category.self) { category in
                
            }
            .onAppear {
                viewModel.getAllCategories()
            }
        }
    }
}

#Preview {
    let vm = HomeViewModel(service: MockFoodService())
    HomeView(viewModel: vm)
}
