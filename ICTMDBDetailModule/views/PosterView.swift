//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import ICTMDBViewKit

struct PosterView: View {
    let detail:TvShowDetailPresentation
    var body: some View {
        ZStack {
            AppImage(
                source: .remote(
                    url:detail.backdropPath ,
                    type: .backgroundBlur))
           
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
           
            VStack{
                
                AppImage(
                    source: .remote(
                        url:detail.mainPoster ,
                        type: .main))
                .containerRelativeFrame(.horizontal) { size, axis in
                    size / 2
                }.overlay(
                    RatingView(score: detail.rating, type: .detail)
                        .padding([.top, .trailing], 8),
                    alignment: .topTrailing
                )
                
                AppText(
                    text: detail.title,
                    style: .sectionHeader,
                    color: .white)
               
              
                    HStack(alignment:.center) {
                        Spacer()
                        ForEach(detail.categories,id:\.startIndex) { category in
                            TagView(title: category)
                        }
                        Spacer()
                    }
                
               
            }.padding(.top,60)
                .padding(.bottom,20)
        }.frame(maxHeight: .infinity)
    }
}


