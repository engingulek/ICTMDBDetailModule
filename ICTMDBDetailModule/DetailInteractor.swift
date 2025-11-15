//
//  DetailInteractor.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import Foundation
import ICTMDBNetworkManagerKit

final class TvShowDetailInteractor : @preconcurrency PresenterToInteractorTvShowDetailProtocol {
    
    
   weak var presenter: (any InteractorToPresenterTvShowDetailProtocol)?
   
    private let network : NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
      
        self.network = network
    }
    let deviceLanguageCode = Locale.current.language.languageCode ?? .english
    @MainActor func loadTvShowDetail(id: Int?) {
        guard let id = id else {return}
        let request = TvShowDetailRequest(
            language: deviceLanguageCode == .turkish ? .tr : .en,
            id: id)
        
        network.execute(request) {[weak self] result in
            guard let self else {return}
            switch result {
            case .success(let data):
                presenter?.onHandle(handle: .sendData(data))
                
            case .failure:
                presenter?.onHandle(handle: .sendError(.detailError))
                
            }
        }
    }
    
    @MainActor func loadTvShowCasts(id: Int?) {
        guard let id = id else {return}
        let request = CastRequest(id: id)
        network.execute(request) { [weak self] result in
            guard let self else {return}
            switch result {
            case .success(let casts):
                presenter?.onHandle(handle: .sendCast(casts.cast))
            case .failure:
                presenter?.onHandle(handle: .sendError(.castError))
            }
        }
    }
}

