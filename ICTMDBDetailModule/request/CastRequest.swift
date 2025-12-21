//
//  CastRequest.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import ICTMDBNetworkManagerKit

struct CastRequest : NetworkRequest {
    typealias Response = CastResult
    
    var id: Int
    var path: NetworkPath {.casts(id)}
    var method: AlamofireMethod  { .GET}
    var headers: [String : String]?
    var parameters: [String : Any]? { [:]}
}
