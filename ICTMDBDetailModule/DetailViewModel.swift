//
//  DetailViewModel.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import Foundation

protocol DetailViewModelProtocol : ObservableObject {
    var isLoading:Bool {get}
    var tvShowDetail:TvShowDetailPresentation? {get}
    var titles:TvShowDetailTitlePresentation{get}
    var casts:[CastPresentation]{get}
    var seasonList:[SeasonPresentation] {get}
    func loaData(id:Int?)
}


final class DetailViewModel : DetailViewModelProtocol {
    @Published var isLoading: Bool = false
   @Published var tvShowDetail: TvShowDetailPresentation? = nil
    private var service:DetailServiceProtocol
    @Published var titles = TvShowDetailTitlePresentation()
    @Published var casts: [CastPresentation] = []
    @Published var seasonList : [SeasonPresentation] = []
    
    
    
    
    init( service: DetailServiceProtocol) {
        self.service = service
    }
    
    func loaData(id: Int?) {
        guard let id else {return}
        isLoading = true
        service.getDetail(id: id) { result in
            switch result {
            case .success(let data):
                self.tvShowDetail = TvShowDetailPresentation(tvShowDetail: data)
                let seasons  = data.seasons
                        guard let seasons = seasons else {return}
                self.seasonList =  seasons.map { SeasonPresentation(season: $0) }
                self.isLoading = false
            case .failure(let failure):
                self.isLoading = false
                print(failure.localizedDescription)
            }
        }
        
        service.getCasts(id: id) { result in
            switch result {
            case .success(let list):
                self.casts = list.map { CastPresentation(cast: $0)}
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }
}
