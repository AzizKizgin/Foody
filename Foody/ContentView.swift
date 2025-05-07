//
//  ContentView.swift
//  Foody
//
//  Created by Aziz Kızgın on 7.05.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showSplash = true
    @AppStorage("showOnboard") private var showOnboard: Bool = true
    var body: some View {
        Group {
            if showSplash {
                SplashScreen()
                    .onAppear {
                        withAnimation {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                showSplash = false
                            }
                        }
                    }
            }
            else if showOnboard {
                OnboardingScreen(onClose: {showOnboard.toggle()})
            }
            else {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}
