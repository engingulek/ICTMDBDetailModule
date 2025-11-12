//
//  DetailViewController+Setup.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import UIKit
import ICTMDBViewKit
import SnapKit
import GenericCollectionViewKit


extension DetailViewController {

   func setupUI() {
       view.backgroundColor = .systemBackground
       
       // Scroll & Content
       view.addSubview(scrollView)
       scrollView.contentInsetAdjustmentBehavior = .never
       scrollView.addSubview(contentView)
       
       // Stack View
       contentView.addSubview(mainStackView)
       mainStackView.axis = .vertical
       mainStackView.spacing = 16
       
       // Poster Section
       mainStackView.addArrangedSubview(posterBGContainerView)
       posterBGContainerView.addSubview(posterBGImageView)
       posterBGContainerView.addSubview(posterBGBlurView)
       mainPoster.addSubview(languageFlag)
       let blurContent = posterBGBlurView.contentView
       [mainPoster, nameLabel, categoryStackView].forEach { blurContent.addSubview($0) }
       
       // Details Section
       mainStackView.addArrangedSubview(createdByTitleLabel)
       mainStackView.addArrangedSubview(createdByStackView)
       [createdByImageView, createdByNameLabel].forEach { createdByStackView.addArrangedSubview($0) }
       
       [firstDateLabel, lastDateLabel, overviewTitleLabel, overviewLabel].forEach { mainStackView.addArrangedSubview($0) }
   }
   
   func setupConstraints() {
       scrollView.snp.makeConstraints { $0.edges.equalToSuperview() }
       contentView.snp.makeConstraints {
           $0.edges.equalTo(scrollView)
           $0.width.equalTo(scrollView)
       }
       mainStackView.snp.makeConstraints { $0.edges.equalToSuperview() }
       
       posterBGContainerView.snp.makeConstraints { $0.leading.trailing.equalToSuperview() }
       posterBGImageView.snp.makeConstraints { $0.edges.equalToSuperview() }
       posterBGBlurView.snp.makeConstraints { $0.edges.equalToSuperview() }
       
       posterTopLayoutConstraint = mainPoster.topAnchor.constraint(equalTo: posterBGBlurView.contentView.topAnchor)
       posterTopLayoutConstraint.isActive = true
       
       mainPoster.snp.makeConstraints {
           $0.centerX.equalToSuperview()
           $0.height.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.4)
           $0.width.equalTo(view.safeAreaLayoutGuide.snp.height).multipliedBy(0.3)
       }
       
       nameLabel.snp.makeConstraints {
           $0.centerX.equalToSuperview()
           $0.top.equalTo(mainPoster.snp.bottom).offset(10)
       }
       
       categoryStackView.snp.makeConstraints {
           $0.centerX.equalToSuperview()
           $0.top.equalTo(nameLabel.snp.bottom).offset(12)
           $0.bottom.equalToSuperview().offset(-10)
       }
       
       createdByImageView.snp.makeConstraints { $0.size.equalTo(60) }
       
       [createdByTitleLabel, createdByStackView,
        firstDateLabel, lastDateLabel,
        overviewTitleLabel, overviewLabel].forEach {
           $0.snp.makeConstraints {
               $0.leading.equalToSuperview().offset(15)
               $0.trailing.equalToSuperview().offset(-15)
           }
       }
       languageFlag.snp.makeConstraints { make in
           make.trailing.equalToSuperview().offset(-10)
           make.top.equalToSuperview()
           make.height.equalTo(80)
       }
   }
}

