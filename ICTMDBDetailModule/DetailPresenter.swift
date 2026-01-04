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
        view?.setNavigationTitle(title: LocalizableUI.detailNavTitle.localized)
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
        Task { 
            await interactor.loadData(id: id)
        }
      
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
    
    func titleForSection(at section: Int) -> GenericCollectionViewKit.HeaderViewItem {
        let headerViewItem : HeaderViewItem
        guard let sectionType = SectionType(rawValue: section)
        else {
            return .init(title: "", sizeType: .empty)
        }
        switch sectionType {
        case .cast:
            headerViewItem = .init(
                title: LocalizableUI.cast.localized,
                icon: .init(
                image: .systemImage("person.3"),
                tintColor: .secondary),
                sizeType: .large)
        case .season:
            headerViewItem = .init(
                title: LocalizableUI.season.localized,
                icon: .init(
                image: .systemImage("film.stack"),
                tintColor: .custom(hex:"#FFA500")),
                sizeType: .large)
        }
        return headerViewItem
    
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
          
        case .sendError:
           castList = []
            break
        case .sendCast(let casts):
            castList = casts.map{CastPresentation(cast: $0) }
            
        }
        
        view?.prepareCollectionView()
        view?.relaodCollectionView()
    }
}
