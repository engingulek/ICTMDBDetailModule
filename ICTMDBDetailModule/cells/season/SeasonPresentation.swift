//
//  SeasonPresentation.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//
import ICTMDBViewKit
struct SeasonPresentation : Equatable {
    let poster : String
    let seasonTitle : String
    let airdate : String
    let episodeCount : String
    let rating:String
    
    init(poster: String, seasonTitle: String, airdate: String, episodeCount: String, rating: String) {
        self.poster = poster
        self.seasonTitle = seasonTitle
        self.airdate = airdate
        self.episodeCount = episodeCount
        self.rating = rating
    }
}

extension SeasonPresentation {
    public init ( season:Season) {
        self.poster = "https://image.tmdb.org/t/p/w500\(season.posterPath ?? "")"
        self.seasonTitle = season.name ?? ""
        self.airdate = "\(LocalizableUI.firstAirDate.localized) : \( season.airDate?.toLongDateString() ?? "N/A")"
        self.episodeCount = "\(LocalizableUI.season.localized) \( season.episodeCount == 0 ? "-" : "\(season.episodeCount ?? 0)")"
        
        self.rating =  "⭐️ \(season.voteAverage ?? 0)"
    }
}
