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
                    AppText(text: viewModel.isError.message, style: .error)
                }
            }
        }
    }
}

#Preview {
    let module = ICTMDBDetailModule()
    module.createTvShowDetailModule(id:79744)
}



