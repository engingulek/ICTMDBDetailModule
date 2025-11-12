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

final class DetailViewController: UIViewController {
    
    // MARK: - Properties
    var presenter: (any ViewToPresenterTvShowDetailProtocol)?
    
     lazy var dataSource: GenericCollectionDataSource<TvShowDetailPresenter>? = {
        guard let presenter = presenter as? TvShowDetailPresenter else { return nil }
        return GenericCollectionDataSource(source: presenter) { identifier, cell, item in
            guard let item = item as? CellItemType else { return }
            switch item {
            case .cast(let castItem):
                (cell as? CastCell)?.configure(cast: castItem)
            case .season(let seasonItem):
                (cell as? SeasonCell)?.configure(season: seasonItem)
            case .none:
                break
            }
        }
    }()
    
     lazy var delegateSource: GenericCollectionDelegate<TvShowDetailPresenter>? = {
        guard let presenter = presenter as? TvShowDetailPresenter else { return nil }
        return GenericCollectionDelegate(source: presenter)
    }()
    
     lazy var layout: GenericCollectionLayoutProvider<TvShowDetailPresenter>? = {
        guard let presenter = presenter as? TvShowDetailPresenter else { return nil }
        return GenericCollectionLayoutProvider(source: presenter)
    }()
    
    // MARK: - UI Components
    let scrollView = UIScrollView()
    let contentView = UIView()
    let mainStackView = UIStackView()
    
    let posterBGContainerView = UIView()
    let posterBGImageView = ImageViewFactory.createImageView(ofType: .background)
    let posterBGBlurView = BlurFactory.createBlurView(ofType: .dark)
    let mainPoster = ImageViewFactory.createImageView(ofType: .main)
    let languageFlag = LabelFactory.createLabel(ofType: .cellLargeTitle(weight: .semibold), textColor: .label)
    let nameLabel = LabelFactory.createLabel(ofType: .cellLargeTitle(weight: .semibold), textColor: .white)
    let categoryStackView = StackViewFactory.createStackView(ofType: .horizontalSpacingSmall)
    
    let createdByTitleLabel = LabelFactory.createLabel(ofType: .cellLargeTitle(weight: .semibold), textColor: .label)
    let createdByStackView = StackViewFactory.createStackView(ofType: .horizontalSpacingMedium)
    let createdByImageView = ImageViewFactory.createImageView(ofType: .main)
    let createdByNameLabel = LabelFactory.createLabel(ofType: .cellLargeTitle(weight: .semibold), textColor: .label)
    
    let firstDateLabel = UILabel()
    let lastDateLabel = UILabel()
    
    let overviewTitleLabel = LabelFactory.createLabel(ofType: .cellLargeTitle(weight: .semibold), textColor: .label)
    let overviewLabel = UILabel()
    
     lazy var collectionView: UICollectionView = {
        guard let layout = layout?.createLayout() else {
            return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        }
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        cv.showsVerticalScrollIndicator = false
        cv.isScrollEnabled = false
        
        cv.register(CastCell.self, forCellWithReuseIdentifier: CastCell.identifier)
        cv.register(SeasonCell.self, forCellWithReuseIdentifier: SeasonCell.identifier)
        cv.register(
            CHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: String(describing: CHeaderView.self)
        )
        return cv
    }()
    
    var posterTopLayoutConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        setupCollectionView()
        presenter?.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let topMargin = view.safeAreaInsets.top + (navigationController?.navigationBar.bounds.height ?? 0) + 8
        posterTopLayoutConstraint.constant = topMargin
    }
}

extension DetailViewController: @preconcurrency PresenterToViewTvShowDetailProtocol {
    func sendData(detail: TvShowDetailPresentation, title: TvShowDetailTitlePresentation) {
        configureExampleData(detail, title)
    }
    
    func prepareCollectionView() {
        configureCollectionData()
    }
    
    func relaodCollectionView() {
        collectionView.reloadData()
    }
}

private extension DetailViewController {
    func configureExampleData(_ detail: TvShowDetailPresentation, _ title: TvShowDetailTitlePresentation) {
        nameLabel.text = detail.title
        mainPoster.setImageWithKigfisher(with: detail.mainPoster)
        posterBGImageView.setImageWithKigfisher(with: detail.backdropPath)
        languageFlag.text = detail.flag
        createdByImageView.setImageWithKigfisher(with: detail.createdByImage)
        createdByNameLabel.text = detail.createdByNameLabel
        createdByTitleLabel.text = title.createdByTitleLabel
        
        let bold: [NSAttributedString.Key: Any] = [.font: UIFont.boldSystemFont(ofSize: 18)]
        let normal: [NSAttributedString.Key: Any] = [.font: UIFont.systemFont(ofSize: 18)]
        
        firstDateLabel.setAttributedText(
            title: title.firstDateLabelTitle,
            value: detail.firstDateLabel,
            boldAttributes: bold, normalAttributes: normal)
        lastDateLabel.setAttributedText(
            title: title.lastDateLabelTitle,
            value: detail.lastDateLabel,
            boldAttributes: bold, normalAttributes: normal)
        
        overviewTitleLabel.text = title.overviewTitleLabel
        overviewLabel.text = detail.overviewLabel
        overviewLabel.numberOfLines = 0
        
        detail.categories.forEach { category in
            let blur = BlurFactory.createBlurView(ofType: .light)
            blur.clipsToBounds = true
            blur.layer.cornerRadius = 10
            
            let categoryLabel = LabelFactory.createLabel(ofType: .msLabel(weight: .semibold), textColor: .white)
            categoryLabel.text = category
            
            blur.contentView.addSubview(categoryLabel)
            categoryLabel.snp.makeConstraints { $0.edges.equalToSuperview().inset(8) }
            categoryStackView.addArrangedSubview(blur)
        }
    }
}




#Preview {
    let module = ICTMDBDetailModule()
    module.createTvShowDetailModule(id: 79744)
}



