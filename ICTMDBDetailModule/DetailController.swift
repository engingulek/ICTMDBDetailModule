//
//  DetailController.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import UIKit
import GenericCollectionViewKit
import ICTMDBViewKit
import SnapKit

final class TvShowDetailViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: (any ViewToPresenterTvShowDetailProtocol)?
    

    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
     
      
        presenter?.viewDidLoad()
    }
    
    
}

extension TvShowDetailViewController: @preconcurrency PresenterToViewTvShowDetailProtocol {
    func sendData() {
        
    }
    
    func prepareCollectionView() {
        
    }
    
    func relaodCollectionView() {
        
    }
}
