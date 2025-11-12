//
//  CastPresentation.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

struct CastPresentation : Equatable {
    let id:Int
    let image:String
    let name:String
    let character:String
    
    init(id: Int, image: String, name: String, character: String) {
        self.id = id
        self.image = image
        self.name = name
        self.character = character
    }
}
extension CastPresentation {
    public init(cast:Cast) {
        self.id = cast.id
        self.image = "https://image.tmdb.org/t/p/w500\(cast.profilePath ?? "")"
        self.name = cast.name
        self.character = cast.character ?? "-"
    }
}
