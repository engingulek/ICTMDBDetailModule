//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI

struct TagView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.callout)
            .fontWeight(.semibold)
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white.opacity(0.3), lineWidth: 1))
    }
}


#Preview {
    TagView(title: "Tag View")
}
