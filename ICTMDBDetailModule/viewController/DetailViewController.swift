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
            case .cast:
                (cell as? CastCell)
            case .season:
                (cell as? SeasonCell)
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

extension TvShowDetailViewController: @preconcurrency PresenterToViewTvShowDetailProtocol {
    func sendData() {
        configureExampleData()
    }
    
    func prepareCollectionView() {
        configureCollectionData()
    }
    
    func relaodCollectionView() {
        collectionView.reloadData()
    }
}

private extension TvShowDetailViewController {
    func configureExampleData() {
      
    }
}



