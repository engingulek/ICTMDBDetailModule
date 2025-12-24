//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import ICTMDBViewKit
struct SeasonsListView: View {
    let seasons:[SeasonPresentation]
    var body: some View {
        VStack{
            HStack{
                AppImage(
                    source: .system(
                        name: "movieclapper.fill",
                        type: .icon(
                            size: .init(width: 40, height: 30),
                            color: .yellow)))
                AppText(text: "Seasons", style: .sectionHeader)
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack {
                    ForEach(seasons, id: \.id) { item in
                        SeasonItemView(item: item)
                    }
                }
            }
        }.padding()
    }
}

