//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import Kingfisher
struct CastsListView: View {
    let casts:[CastPresentation]
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.3.fill")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .foregroundStyle(.gray)
                Text("Casts")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack {
                    ForEach(casts, id: \.id) { item in
                        VStack(spacing: 5) {
                            // ... Mevcut Kart Tasarımın ...
                            KFImage(URL(string: item.image))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 100)
                                .frame(maxWidth: .infinity)
                                .clipped()
                            
                            Text(item.name)
                                .font(.system(size: 16, weight: .bold))
                              
                               
                            
                            Text(item.character)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundStyle(.gray)
                              
                               
                        }
                        .padding()
                        .background(Color(.secondarySystemGroupedBackground))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
                    }
                }
            }
        }.padding()
    }
}

