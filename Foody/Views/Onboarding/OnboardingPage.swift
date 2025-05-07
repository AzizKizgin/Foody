//
//  OnboardingPage.swift
//  Foody
//
//  Created by Aziz Kızgın on 8.05.2025.
//

import SwiftUI

struct OnboardingPage: View {
    let title: String
    let content: String
    let image: String
    var body: some View {
        VStack(spacing: 40) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(title)
                .font(.title)
                .bold()
            Text(content)
                .multilineTextAlignment(.center)
                .font(.title3)
        }
    }
}

#Preview {
    OnboardingPage(
        title: "All your favorites",
        content: "Get all your loved foods in one place,you just place the order we do rest",
        image: "phone"
    )
}
