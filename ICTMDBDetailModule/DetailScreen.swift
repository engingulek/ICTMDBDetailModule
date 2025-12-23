//
//  SwiftUIView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import SwiftUI
import Kingfisher
import ICTMDBViewKit
struct DetailScreen<VM: DetailViewModelProtocol>: View {
    @StateObject var viewModel: VM
    
    var body: some View {
        VStack {
            
            if viewModel.isLoading {
                VStack {
                    ProgressView()
                        .font(.largeTitle)
                        .foregroundStyle(.black)
                }
            }else{
                if let detail = viewModel.tvShowDetail {
                    ScrollView {
                        VStack(alignment:.leading) {
                            PosterView(detail: detail)
                            SubInfoView(detail: detail, titles: viewModel.titles)
                            CastsListView(casts: viewModel.casts)
                            SeasonsListView(seasons: viewModel.seasonList)
                            Spacer()
                        }
                    }.ignoresSafeArea()
                } else {
                    Text("Something went wrong")
                }
            }
        }
    }
}

#Preview {
    ICTMDBDetailModule.createModule(id: 79744)
}

struct TagView: View {
    let title: String
    var body: some View {
        Text(title)
            .font(.callout)
            .fontWeight(.semibold)
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color.white.opacity(0.2))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color.white.opacity(0.3), lineWidth: 1))
    }
}

struct DateInfoRow: View {
    let label: String
    let value: String
    var body: some View {
        HStack {
            Text(label).fontWeight(.bold)
            Text(value)
        }
        .font(.subheadline)
    }
}
