//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import Kingfisher
struct SeasonsListView: View {
    let seasons:[SeasonPresentation]
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "movieclapper.fill")
                    .resizable()
                    .frame(width: 40,height: 30)
                    .foregroundStyle(.yellow)
                Text("Seasons")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            ScrollView(.horizontal,showsIndicators: false) {
                LazyHStack {
                    ForEach(seasons, id: \.id) { item in
                        HStack(spacing:5){
                            KFImage(URL(string: item.poster))
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(height: 130)
                                
                                .cornerRadius(10)
                                
                                .clipped()
                            VStack(alignment: .leading){
                                HStack {
                                    Text(item.seasonTitle)
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    Spacer(minLength: 50)
                                    Text(item.rating)
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                }
                                Text(item.episodeCount)
                                Text(item.airdate)
                                Spacer()
                               
                            }
                        } .padding()
                            .background(Color(.secondarySystemGroupedBackground))
                            .cornerRadius(12)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: 2)
                       
                    }
                }
            }
        }.padding()
    }
}

