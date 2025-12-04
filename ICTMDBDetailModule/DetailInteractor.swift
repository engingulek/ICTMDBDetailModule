//
//  DetailInteractor.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import Foundation
import ICTMDBNetworkManagerKit

final class TvShowDetailInteractor : PresenterToInteractorTvShowDetailProtocol {
   
    
    
    
   weak var presenter: (any InteractorToPresenterTvShowDetailProtocol)?
   
    private let network : NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
      
        self.network = network
    }
    let deviceLanguageCode = Locale.current.language.languageCode ?? .english
    
    
    func loadTvShowDetail(id: Int?) async {
        do{
            guard let id = id else {return}
            let request = TvShowDetailRequest(
                language: deviceLanguageCode == .turkish ? .tr : .en,
                id: id)
            let result = try await network.execute(request)
            presenter?.onHandle(handle: .sendData(result))
        }catch{
            presenter?.onHandle(handle: .sendError(.detailError))
        }
    }
    
    func loadTvShowCasts(id: Int?) async {
        do{
            guard let id = id else {return}
            let request = CastRequest(id: id)
            let result = try await network.execute(request)
            presenter?.onHandle(handle: .sendCast(result.cast))
        }catch{
            presenter?.onHandle(handle: .sendError(.castError))
        }
    }
}

