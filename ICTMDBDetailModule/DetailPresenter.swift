//
//  DetailPresenter.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import Foundation
import ICTMDBViewKit
import GenericCollectionViewKit

final class TvShowDetailPresenter {
    weak var view: PresenterToViewTvShowDetailProtocol?
    
    private var interactor: PresenterToInteractorTvShowDetailProtocol
    private let title = TvShowDetailTitlePresentation()
    private var seasonList: [SeasonPresentation] = []
    private var castList : [CastPresentation] = []
    
    init(view: PresenterToViewTvShowDetailProtocol?,
         interactor: PresenterToInteractorTvShowDetailProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: "backColor")
        view?.setNavigationTitle(title: "Detail")
       // view?.prepareCollectionView()
    }
}

extension TvShowDetailPresenter: ViewToPresenterTvShowDetailProtocol {
    func layout(for sectionIndex: Int) -> LayoutSource {
        guard let sectionType = SectionType(rawValue: sectionIndex) else {
            return LayoutSourceTeamplate.none.template
        }
        
        switch sectionType {
        case .cast:
            return  LayoutSource(
                groupOrientation: .horizontal,
                itemSize: .init(
                    width: (type: .fractional, value: 1.0 ),
                    height: (type: .fractional, value: 0.7)),
                groupSize: .init(
                    width: (type: .fractional, value: 0.4),
                    height: (type: .fractional, value: 0.45)),
                sectionInsets: (top: 0, leading: 5, bottom: 0, trailing: 5),
                interItemSpacing: 0,
                interGroupSpacing: 0,
                scrollDirection: .horizontal
            )
        case .season:
            return LayoutSourceTeamplate.horizontalSingleRow.template
        }
    }
    
    func getID(id: Int?) {
        guard let id = id  else {return}
        interactor.loadTvShowDetail(id: id)
        interactor.loadTvShowCasts(id: id)
      
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        guard let sectionType = SectionType(rawValue: section) else {return 0}
        switch sectionType {
        case .cast:
            return castList.count
        case .season:
            return  seasonList.count
        }
    }
    
    func numberOfSections() -> Int {
        SectionType.allCases.count
    }
    
    func cellForItem(section: Int,item:Int) -> CellItemType {
        guard let sectionType = SectionType(rawValue: section) else { return .none }
        switch sectionType {
        case .cast:
            let data = castList[item]
            return .cast(data)
        case .season:
            let data = seasonList[item]
            return .season(data)
        }
    }
    
   
    
    func titleForSection(at section: Int) -> (
        title: String, sizeType:SectionSizeType,
        buttonType: [TitleForSectionButtonType]?) {
            guard let sectionType = SectionType(rawValue: section) else { return  (title:"",sizeType:.small,buttonType:[]) }
            var item : (title: String, sizeType: SectionSizeType,buttonType: [TitleForSectionButtonType]?)
            switch sectionType {
            case .cast:
                item = (title:LocalizableUI.cast.localized,sizeType:.large,buttonType:[])
            case .season:
                item = (title:LocalizableUI.season.localized,sizeType:.large,buttonType:[])
            }
            return item
        }
    
    func sectionType(at section: Int) -> SectionType {
        return SectionType(rawValue: section) ?? .cast
    }
    
    func cellIdentifier(at section: Int) -> String {
        guard let section  = SectionType(rawValue: section) else {return ""}
        switch section {
        case .cast: return CastCell.identifier
        case .season: return SeasonCell.identifier
            
        }
    }
}

extension TvShowDetailPresenter: InteractorToPresenterTvShowDetailProtocol {
    func onHandle(handle: TvShowInteractorResult) {
        switch handle {
        case .sendData(let detail):
            let detailPresentation = TvShowDetailPresentation(tvShowDetail: detail)
            view?.sendData(detail: detailPresentation, title: title)
            let seasons  = detail.seasons
            guard let seasons = seasons else {return}
            seasonList =  seasons.map { SeasonPresentation(season: $0) }
          
        case .sendError(let error):
            switch error {
            case .detailError:
                break
            case .castError:
                castList = []
            }
        case .sendCast(let casts):
            castList = casts.map{CastPresentation(cast: $0) }
            
        }
        
        view?.prepareCollectionView()
        view?.relaodCollectionView()
    }
}
