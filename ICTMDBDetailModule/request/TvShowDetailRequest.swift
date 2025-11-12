//
//  TvShowDetailRequest.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import ICTMDBNetworkManagerKit

struct TvShowDetailRequest :  NetworkRequest {
    typealias Response = TvShowDetail
    var language: RequestLanguage
    var id: Int
  
    var path: NetworkPath {.detail(id)}
    var method:AlamofireMethod { .GET}
    var headers: [String : String]?
    var parameters: [String : Any]? {
        [
            "language": language,
        ]
    }
}
