//
//  TvShowDetail.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

import Foundation
// MARK: - TvShowDetail
struct TvShowDetail: Codable {
    let adult: Bool?
    let backdropPath: String?
    let createdBy: [CreatedBy]?
    let firstAirDate: String?
    let genres: [Genre]?
    let id: Int
    let languages: [String]?
    let name: String?
    let nextEpisodeToAir: TEpisodeToAir?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let posterPath: String
    let seasons: [Season]?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case createdBy = "created_by"
        case firstAirDate = "first_air_date"
        case genres, id, languages
        case name
        case nextEpisodeToAir = "next_episode_to_air"
      
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case seasons
       
        case voteAverage = "vote_average"
    }
}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}

// MARK: - TEpisodeToAir
struct TEpisodeToAir: Codable {
    let id: Int?
    let airDate: String?


    enum CodingKeys: String, CodingKey {
        case id
        case airDate = "air_date"
      
    }
}

// MARK: - Season
struct Season: Codable {
    let airDate: String?
    let episodeCount: Int?
    let id: Int?
    let name: String?
    let overview: String?
    let posterPath: String?
    let seasonNumber: Int?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case airDate = "air_date"
        case episodeCount = "episode_count"
        case id, name, overview
        case posterPath = "poster_path"
        case seasonNumber = "season_number"
        case voteAverage = "vote_average"
    }
}

struct CreatedBy: Codable {
    let id: Int?
    let creditID, name, originalName: String?
    let gender: Int?
    let profilePath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case creditID = "credit_id"
        case name
        case originalName = "original_name"
        case gender
        case profilePath = "profile_path"
    }
}
