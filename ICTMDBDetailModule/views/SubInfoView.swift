//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import ICTMDBViewKit
struct SubInfoView: View {
    let detail:TvShowDetailPresentation
    let titles : TvShowDetailTitlePresentation
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            AppText(text:titles.createdByTitleLabel , style: .sectionHeader)
     
            
            HStack(spacing: 15) {
                AppImage(source:
                        .remote(
                            url: detail.createdByImage,
                            type: .main))
                .frame(width: 60, height: 60)
                .padding(.vertical)
               
                AppText(text: detail.createdByNameLabel, style: .cardTitle)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                
                DateInfoRow(label:titles.firstDateLabelTitle, value: detail.firstDateLabel)
                DateInfoRow(label: titles.lastDateLabelTitle, value: detail.lastDateLabel)
            }
            
          
            VStack(alignment: .leading, spacing: 10) {
                AppText(text: titles.overviewTitleLabel, style: .sectionHeader)
               
                AppText(
                    text: detail.overviewLabel,
                    style: .body,color: .primary.opacity(0.8))
            
            }
        }
        .padding(.top)
        .padding(.horizontal)
    }
}


