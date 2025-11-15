//
//  DetailProtocols.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

typealias Ables = UIViewAble & NavConUIAble
 import ICTMDBViewKit
 import GenericCollectionViewKit



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


protocol PresenterToInteractorTvShowDetailProtocol {
    var presenter: InteractorToPresenterTvShowDetailProtocol? {get set}
    func loadTvShowDetail(id:Int?)
    func loadTvShowCasts(id:Int?)
}


enum TvShowErrorType : Error{
    case detailError
    case castError
}
enum TvShowInteractorResult {
    case sendData(_ data: TvShowDetail,)
    case sendCast(_ data:[Cast])
    case sendError(_ error:TvShowErrorType)
}

protocol InteractorToPresenterTvShowDetailProtocol : AnyObject {
    func onHandle(handle:TvShowInteractorResult)
   
}


protocol PresenterToRouterTvShowDetailProtocol {
    
}
