//
//  SplashScreen.swift
//  Foody
//
//  Created by Aziz Kızgın on 7.05.2025.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
    }
}

#Preview {
    SplashScreen()
}
