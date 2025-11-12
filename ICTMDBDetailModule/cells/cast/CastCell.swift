//
//  CastCell.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import UIKit
import SnapKit
import ICTMDBViewKit

final class CastCell: UICollectionViewCell {
    static let identifier = "CastCellIdentifier"
    private let containerView = UIView()
    private let castImageView = UIImageView()
    private let nameLabel = UILabel()
    private let characterLabel = UILabel()
    
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
        containerView.addSubview(castImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(characterLabel)
        
      
        contentView.backgroundColor = .blue
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: 0, height: 4)
        layer.shadowRadius = 6
        layer.masksToBounds = false
        
      
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        
       
        castImageView.contentMode = .scaleAspectFill
        castImageView.clipsToBounds = true
        castImageView.layer.cornerRadius = 8
        
       
        nameLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 1
        
        characterLabel.font = .systemFont(ofSize: 13, weight: .regular)
        characterLabel.textColor = .darkGray
        characterLabel.textAlignment = .center
        characterLabel.numberOfLines = 1
        
      
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(6)
        }
        
        castImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(castImageView.snp.bottom).offset(6)
            make.left.right.equalToSuperview().inset(8)
        }
        
        characterLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(4)
            make.left.right.equalToSuperview().inset(8)
            make.bottom.lessThanOrEqualToSuperview().inset(8)
        }
    }
    
    func configure() {
       
    }
    

}

#Preview {
    CastCell()
}

