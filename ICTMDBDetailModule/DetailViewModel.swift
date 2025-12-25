//
//  DetailViewModel.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import Foundation
import ICTMDBViewKit
protocol DetailViewModelProtocol : ObservableObject {
    var isLoading:Bool {get}
    var isError:(state:Bool,message:String) {get}
    var tvShowDetail:TvShowDetailPresentation? {get}
    var titles:TvShowDetailTitlePresentation{get}
    var casts:[CastPresentation]{get}
    var seasonList:[SeasonPresentation] {get}
    func loaData(id:Int?)
}


final class DetailViewModel : DetailViewModelProtocol {
    @Published var isLoading: Bool = false
   @Published var tvShowDetail: TvShowDetailPresentation? = nil
  
    @Published var titles = TvShowDetailTitlePresentation()
    @Published var casts: [CastPresentation] = []
    @Published var seasonList : [SeasonPresentation] = []
    @Published var isError: (state: Bool, message: String) = (false, "")
    private var service:DetailServiceProtocol
    
    init( service: DetailServiceProtocol) {
        self.service = service
    }
    
    deinit {
        print("DEBUG: DetailViewModel removed ✅")
    }
    
    
    func loaData(id: Int?) {
        guard let id else {return}
        isLoading = true
        service.getDetail(id: id) {[weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let data):
                tvShowDetail = TvShowDetailPresentation(tvShowDetail: data)
                let seasons  = data.seasons
                        guard let seasons = seasons else {return}
                seasonList =  seasons.map { SeasonPresentation(season: $0) }
                isLoading = false
                isError = (state:false,message:"")
            case .failure:
                isLoading = false
                isError = (state:true,message:LocalizableUI.somethingWentWrong.localized)
            }
        }
        
        service.getCasts(id: id) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                casts = list.map { CastPresentation(cast: $0)}
            case .failure(let failure):
                print(failure.localizedDescription)
            }
        }
        
    }
}
