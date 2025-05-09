//
//  CategoryItem.swift
//  Foody
//
//  Created by Aziz Kızgın on 9.05.2025.
//

import SwiftUI

struct CategoryItem: View {
    @State private var showDesc: Bool = false
    let category: Category
    var body: some View {
        VStack {
            let fixedUrl = category.image.replacingOccurrences(
                of: "\\/",
                with: "/"
            )
            
            if showDesc {
                Text(category.desc)
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity
                    )
                    .multilineTextAlignment(.center)

            }
            else {
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
            }
            Text(category.name)
                .padding(.vertical, 10)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
        )
        .overlay(alignment: .topTrailing, content: {
            Button {
                showDesc.toggle()
            } label: {
                Image(systemName: showDesc ? "x.circle.fill":  "questionmark.circle.fill")
                    .font(.title)
                    .padding()
            }

        })
        .shadow(color: Color.primary.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(10)
        .animation(.snappy, value: showDesc)
    }
}

#Preview {
    CategoryItem(category: Category(id: "1", name: "1", image: "1", desc: "1"))
}
