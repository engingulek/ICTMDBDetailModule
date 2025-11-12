//
//  TvShowDetailViewController+CollectionView.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

 import UIKit
import SnapKit
extension DetailViewController{
   
   func setupCollectionView() {
       mainStackView.addArrangedSubview(collectionView)
              collectionView.snp.makeConstraints { $0.height.equalTo(570) }
              
              collectionView.dataSource = dataSource
              collectionView.delegate = delegateSource
   }
   
   func configureCollectionData() {
       collectionView.dataSource = dataSource
              collectionView.delegate = delegateSource
   }
}
