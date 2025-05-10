//
//  ContentView.swift
//  Foody
//
//  Created by Aziz Kızgın on 7.05.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    @State private var showSplash = true
    @AppStorage("showOnboard") private var showOnboard: Bool = true
    @AppStorage("isLogin") private var islogin = false
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
            else if islogin {
                NavigationStack {
                    HomeView()
                        
                        .toolbarCart()
                }
            }
            else {
                LoginView()
            }
        }
        .environmentObject(cartManager)
    }
}

#Preview {
    @Previewable @StateObject var cartManager = CartManager()
    ContentView()
        .environmentObject(cartManager)
}
