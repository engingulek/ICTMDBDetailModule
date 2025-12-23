//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import Kingfisher
struct SubInfoView: View {
    let detail:TvShowDetailPresentation
    let titles : TvShowDetailTitlePresentation
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(titles.createdByTitleLabel)
                .font(.title3)
                .fontWeight(.bold)
            
            HStack(spacing: 15) {
                KFImage(URL(string: detail.createdByImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(detail.createdByNameLabel)
                    .font(.headline)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                DateInfoRow(label:titles.firstDateLabelTitle, value: detail.firstDateLabel)
                DateInfoRow(label: titles.lastDateLabelTitle, value: detail.lastDateLabel)
            }
            
            // Özet Bilgisi
            VStack(alignment: .leading, spacing: 10) {
                Text(titles.overviewTitleLabel)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(detail.overviewLabel)
                    .font(.body)
                    .foregroundColor(.primary.opacity(0.8))
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
}


