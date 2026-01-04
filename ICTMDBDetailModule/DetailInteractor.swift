//
//  DetailInteractor.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import Foundation
import ICTMDBNetworkManagerKit

final class TvShowDetailInteractor : PresenterToInteractorTvShowDetailProtocol,@unchecked Sendable {
  
   
   weak var presenter: (any InteractorToPresenterTvShowDetailProtocol)?
   
    private let network : NetworkManagerProtocol
    
    init(network: NetworkManagerProtocol) {
      
        self.network = network
    }
    let deviceLanguageCode = Locale.current.language.languageCode ?? .english
    
    
    func loadData(id: Int?) async {
        guard let id else {return}
        let detailRequest = TvShowDetailRequest(
            language: deviceLanguageCode == .turkish ? .tr : .en,
            id: id)
        let castRequest = CastRequest(id: id)
        
        async let detail = network.execute(detailRequest)
        async let cast = network.execute(castRequest)
        
        do{
            let (detailResult,castResult) = try await (detail,cast)
            await MainActor.run {
                presenter?.onHandle(handle: .sendData(detailResult))
                presenter?.onHandle(handle: .sendCast(castResult.cast))
            }
          
        }catch{
            await MainActor.run {
                presenter?.onHandle(handle: .sendError)
            }
            
        }
        
    }
    
}

