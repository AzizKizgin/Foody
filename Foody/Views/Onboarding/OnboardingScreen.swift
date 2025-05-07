//
//  OnboardingScreen.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct OnboardingScreen: View {
    let onClose: () -> Void
    @State private var currentScreen = 0
    var body: some View {
        VStack {
            TabView(selection: $currentScreen) {
                OnboardingPage(
                    title: "All your favorites",
                    content: "Get all your loved foods in one place,you just place the order we do rest",
                    image: "phone"
                )
                .tag(0)
                OnboardingPage(
                    title: "Order whatever you want",
                    content: "Get all your loved foods in one place,you just place the order we do rest",
                    image: "chef"
                )
                .tag(1)
                OnboardingPage(
                    title: "Free delivery offers",
                    content: "Get all your loved foods in one place,you just place the order we do rest",
                    image: "deliver"
                )
                .tag(2)
            }
            .frame(maxHeight: .infinity)
            Button(action: onNext) {
                Text("Next")
                    .frame(width: 200, height: 40)
            }
            .buttonStyle(.borderedProminent)
        }
    }
    
    private func onNext() {
        if currentScreen < 2 {
            currentScreen += 1
        }
        else {
            onClose()
        }
    }
}

#Preview {
    OnboardingScreen(onClose: {})
}
