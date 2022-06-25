//
//  League.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 21/06/2022.
//

import Foundation

//// MARK: - Welcome
//struct LeagueModel: Codable {
//    let leagues: [League]
//}
//
//// MARK: - League
//struct League: Codable {
//    let idLeague, strLeague, strSport: String
//    let strLeagueAlternate: String?
//}


struct LeagueModel: Codable {
    let countries: [League]?
}

struct League: Codable {
    let idLeague, strLeague, strSport, strYoutube, strBadge: String
    let strLeagueAlternate: String?
}



