//
//  DetailProtocols.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

typealias Ables = UIViewAble & NavConUIAble
 import ICTMDBViewKit
 import GenericCollectionViewKit


@MainActor
protocol ViewToPresenterTvShowDetailProtocol:
    AnyObject, GenericCollectionDataSourceProtocol,
    GenericCollectionDelegateSourceProtocol,
                                      GenericCollectionLayoutProviderProtocol{
    var view : PresenterToViewTvShowDetailProtocol? {get}
    func viewDidLoad()
    func getID(id:Int?)
   
}


protocol PresenterToViewTvShowDetailProtocol : AnyObject,Ables{
    func sendData(detail:TvShowDetailPresentation,title:TvShowDetailTitlePresentation)
    func relaodCollectionView()
    func prepareCollectionView()
}


protocol PresenterToInteractorTvShowDetailProtocol:Sendable,AnyObject  {
    var presenter: InteractorToPresenterTvShowDetailProtocol? {get set}
    func loadData(id:Int?) async
}



enum TvShowInteractorResult {
    case sendData(_ data: TvShowDetail,)
    case sendCast(_ data:[Cast])
    case sendError
}

@MainActor
protocol InteractorToPresenterTvShowDetailProtocol : AnyObject {
    func onHandle(handle:TvShowInteractorResult)
}


protocol PresenterToRouterTvShowDetailProtocol {
    
}
