//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI
import ICTMDBViewKit
struct CastItemView: View {
    let item:CastPresentation
    var body: some View {
        VStack(spacing: 5) {
            AppImage(source: .remote(url: item.image, type: .main))
               
                .frame(height: 100)
                .frame(maxWidth: .infinity)
                .clipped()
          
            AppText(text: item.name, style: .castName)
            AppText(text: item.character, style: .castCharacter)
        }
        .padding()
        .background(Color(.secondarySystemGroupedBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}
