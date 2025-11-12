//
//  ICTMDBDetailModule.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import Foundation
import UIKit
import ICTMDBModularProtocols
import ICTMDBNetworkManagerKit

public class ICTMDBDetailModule : @preconcurrency TvShowDetailProtocol {
   
    
    public init() { }
    @MainActor
    public func createTvShowDetailModule(id: Int?) -> UIViewController {
        let viewController =  DetailViewController()
        let _ = DetailRouter()
        let interactor = TvShowDetailInteractor(network: NetworkManager())
        let presenter : any ViewToPresenterTvShowDetailProtocol & InteractorToPresenterTvShowDetailProtocol
        = TvShowDetailPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        interactor.presenter = presenter
        presenter.getID(id: id)
        return viewController
    }
}

