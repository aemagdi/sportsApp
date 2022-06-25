//
//  Team.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//

import Foundation

struct TeamModel: Codable {
    let teams: [Team]?
}

struct Team: Codable {
    let strTeamBadge,idLeague, strLeague, strTeam, idTeam, strCountry, strStadium: String
}

