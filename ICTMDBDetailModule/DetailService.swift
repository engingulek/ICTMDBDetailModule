//
//  DetailService.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 23.12.2025.
//

import Foundation
import ICTMDBNetworkManagerKit

protocol DetailServiceProtocol {
    func getDetail(id:Int,completion: @escaping (Result<TvShowDetail, Error>) -> Void)
    func getCasts(id:Int,completion: @escaping (Result<[Cast], Error>) -> Void)
}

final class DetailService : DetailServiceProtocol {
   
    let deviceLanguageCode = Locale.current.language.languageCode ?? .english
    
    private let network : NetworkManagerProtocol
    init(network: NetworkManagerProtocol) {
        self.network = network
    }
    
    func getDetail(id: Int,completion: @escaping (Result<TvShowDetail, Error>) -> Void) {
        let request = TvShowDetailRequest(
            language: deviceLanguageCode == .turkish ? .tr : .en,
            id: id)
        
        network.execute(request) { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
    
    func getCasts(id: Int, completion: @escaping (Result<[Cast], any Error>) -> Void) {
        let request = CastRequest(id: id)
        network.execute(request) { result in
            switch result {
            case .success(let data):
                completion(.success(data.cast))
            case .failure(let failure):
                completion(.failure(failure))
            }
        }
    }
}
