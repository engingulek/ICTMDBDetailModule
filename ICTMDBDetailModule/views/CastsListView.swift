//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import ICTMDBViewKit
struct CastsListView: View {
    let casts:[CastPresentation]
    var body: some View {
        VStack{
            HStack{
                AppImage(
                    source: .system(
                        name:"person.3.fill" ,
                        type: .icon(size: .init(width: 40.0, height: 30.0), color: .gray)))
                AppText(text: "Casts", style: .sectionHeader)
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack {
                    ForEach(casts, id: \.id) { item in
                        CastItemView(item: item)
                        
                    }
                }
            }
        }.padding()
    }
}
