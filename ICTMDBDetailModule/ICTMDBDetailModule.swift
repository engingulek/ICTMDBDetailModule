//
//  ICTMDBDetailModule.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import Foundation
import SwiftUI

import ICTMDBNetworkManagerKit
import ICTMDBModularProtocols
public class ICTMDBDetailModule  : @MainActor TvShowDetailProtocol {
    public init() { }
    @MainActor   public func createTvShowDetailModule(id: Int?) -> AnyView {
        let viewModel = DetailViewModel(service: DetailService(network: NetworkManager()))
        viewModel.loaData(id: id)
        let view = DetailScreen(viewModel: viewModel)
        return AnyView(view)
    }

}

