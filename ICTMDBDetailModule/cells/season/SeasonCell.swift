//
//  SeasonCell.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import UIKit
import SnapKit
import ICTMDBViewKit

final class SeasonCell: UICollectionViewCell {
    static let identifier = "SeasonCellIdentifier"
    let containerView = UIView()
    let posterImageView = UIImageView()
    let seasonLabel = UILabel()
    let airDateLabel = UILabel()
    let episodeCountLabel = UILabel()
    let ratingLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(posterImageView)
        containerView.addSubview(seasonLabel)
        containerView.addSubview(airDateLabel)
        containerView.addSubview(episodeCountLabel)
        containerView.addSubview(ratingLabel)
        
      
        contentView.backgroundColor = .red
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        layer.masksToBounds = false
        
        
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
      
        posterImageView.contentMode = .scaleAspectFill
        posterImageView.layer.cornerRadius = 8
        posterImageView.clipsToBounds = true
        
        seasonLabel.font = .boldSystemFont(ofSize: 16)
        airDateLabel.font = .systemFont(ofSize: 14)
        airDateLabel.textColor = .gray
        episodeCountLabel.font = .systemFont(ofSize: 14)
        episodeCountLabel.textColor = .darkGray
        ratingLabel.font = .boldSystemFont(ofSize: 14)
        ratingLabel.textColor = .systemYellow
        
      
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
        
        posterImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.width.equalTo(100)
        }
        
        ratingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        seasonLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.left.equalTo(posterImageView.snp.right).offset(8)
            make.right.lessThanOrEqualTo(ratingLabel.snp.left).offset(-8)
        }
        
        airDateLabel.snp.makeConstraints { make in
            make.top.equalTo(seasonLabel.snp.bottom).offset(4)
            make.left.equalTo(seasonLabel)
            make.right.lessThanOrEqualToSuperview().inset(8)
        }
        
        episodeCountLabel.snp.makeConstraints { make in
            make.top.equalTo(airDateLabel.snp.bottom).offset(4)
            make.left.equalTo(seasonLabel)
            make.right.lessThanOrEqualToSuperview().inset(8)
        }
    }
    
    func configure() {
    }
}

#Preview {
    SeasonCell()
}

