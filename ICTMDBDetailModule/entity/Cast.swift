//
//  Cast.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

struct CastResult:Codable {
    let cast: [Cast]
    let id: Int
}

struct Cast: Codable {
    let adult: Bool
    let gender, id: Int
    let name: String
    let profilePath: String?
    let character: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case profilePath = "profile_path"
        case character
    }
}

enum Department: String, Codable {
    case crew = "Crew"
    case production = "Production"
    case sound = "Sound"
}
