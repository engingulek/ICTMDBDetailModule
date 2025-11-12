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
  
    
    init(view: PresenterToViewTvShowDetailProtocol?,
         interactor: PresenterToInteractorTvShowDetailProtocol) {
        self.view = view
        self.interactor = interactor
    }
    
    func viewDidLoad() {
        view?.setBackColorAble(color: "backColor")
       
    }
}

extension TvShowDetailPresenter: ViewToPresenterTvShowDetailProtocol {
    func layout(for sectionIndex: Int) -> LayoutSource {
      
    }
    
    func getID(id: Int?) {
        guard let id = id  else {return}
     
      
    }
    
    func numberOfRowsInSection(in section: Int) -> Int {
        
    }
    
    func numberOfSections() -> Int {
        
    }
    
    func cellForItem(section: Int,item:Int) -> CellItemType {
        
    }
    
   
    
    func titleForSection(at section: Int) -> (
        title: String, sizeType:SectionSizeType,
        buttonType: [TitleForSectionButtonType]?) {
           
        }
    
    func sectionType(at section: Int) -> SectionType {
       
    }
    
    func cellIdentifier(at section: Int) -> String {
       
    }
}

extension TvShowDetailPresenter: InteractorToPresenterTvShowDetailProtocol {
    func onHandle(handle: TvShowInteractorResult) {
        
    }
}
