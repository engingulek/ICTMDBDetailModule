//
//  enums.swift
//  ICTMDBDetailModule
//
//  Created by Engin Gülek on 12.11.2025.
//

enum SectionType: Int, CaseIterable {
    case cast
    case season

}

enum CellItemType {
    case cast(CastPresentation)
    case season(SeasonPresentation)
    case none
}

