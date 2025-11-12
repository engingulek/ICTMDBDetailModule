//
//  TvShowDetailPresentation.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import ICTMDBViewKit

struct TvShowDetailPresentation : Equatable {
    var title:String
    var flag:String
    var rating: Double
    var mainPoster:String
    var createdByImage: String
    var createdByNameLabel:String
    var firstDateLabel:String
    var lastDateLabel:String
    var overviewLabel:String
    var categories:[String]
    var backdropPath:String
  
    
    init(title: String, flag: String, rating: Double, mainPoster: String, createdByImage: String, createdByNameLabel: String, firstDateLabel: String, lastDateLabel: String, overviewLabel: String, categories: [String],
         backdropPath:String) {
        self.title = title
        self.flag = flag
        self.rating = rating
      
        self.mainPoster = mainPoster
        self.createdByImage = createdByImage
        self.createdByNameLabel = createdByNameLabel
        self.firstDateLabel = firstDateLabel
        self.lastDateLabel = lastDateLabel
        self.overviewLabel = overviewLabel
        self.categories = categories
        self.backdropPath = backdropPath
    }
}


extension TvShowDetailPresentation {
    public init(tvShowDetail:TvShowDetail){
        self.backdropPath = "https://image.tmdb.org/t/p/w500\(tvShowDetail.backdropPath ?? "")"
        self.title = tvShowDetail.name ?? ""
        self.flag = tvShowDetail.languages?.map{ LanguageFlags.flag(for: $0)} .joined(separator: " ") ?? ""
        self.rating = tvShowDetail.voteAverage ?? 0
        self.mainPoster = "https://image.tmdb.org/t/p/w500\(tvShowDetail.posterPath)"
        self.createdByImage = "https://image.tmdb.org/t/p/w500\(tvShowDetail.createdBy?.first?.profilePath ?? "")"
        self.createdByNameLabel = tvShowDetail.createdBy?.first?.name ?? ""
        self.firstDateLabel = tvShowDetail.firstAirDate?.toLongDateString() ?? ""
        self.lastDateLabel = tvShowDetail.nextEpisodeToAir?.airDate?.toLongDateString() ?? ""
        self.overviewLabel = tvShowDetail.overview ?? ""
        self.categories = tvShowDetail.genres?.map { $0.name ?? "" } ?? []
    }
}

