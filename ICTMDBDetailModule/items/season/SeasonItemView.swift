//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 24.12.2025.
//

import SwiftUI
import ICTMDBViewKit
struct SeasonItemView: View {
    let item : SeasonPresentation
    var body: some View {
        HStack(spacing:5){
            AppImage(
                source: .remote(
                    url:  item.poster,
                    type: .main))
                .frame(height: 130)

            VStack(alignment: .leading){
                HStack {
                    AppText(text: item.seasonTitle, style: .cardTitle)
                    Spacer(minLength: 40)
                    AppText(text: item.rating, style: .caption)
                }
                AppText(text: item.episodeCount, style: .body)
                AppText(text: item.airdate, style: .body)
                Spacer()
               
            }
        } .padding()
            .background(Color(.secondarySystemGroupedBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
    }
}

