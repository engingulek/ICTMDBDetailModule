//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import Kingfisher
struct PosterView: View {
    let detail:TvShowDetailPresentation
    var body: some View {
        ZStack {
            KFImage(URL(string:detail.backdropPath))
                .resizable()
            
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 25)
                .overlay(Color.black.opacity(0.4))
            
            VStack{
                KFImage(URL(string: detail.mainPoster))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.width / 2) // SnapKit multiply(0.25) mantığı
                    .cornerRadius(8)
                Text(detail.title)
                    .foregroundStyle(.white)
                    .font(.title)
                    .fontWeight(.semibold)
              
                    HStack(alignment:.center) {
                        Spacer()
                        ForEach(detail.categories,id:\.self) { category in
                            TagView(title: category)
                        }
                        Spacer()
                    }
                
               
            }.padding(.top,60)
                .padding(.bottom,20)
        }.frame(height: .infinity)
    }
}


