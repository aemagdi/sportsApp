//
//  Sports.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 20/06/2022.
//

import Foundation

//// MARK: - Welcome
struct SportModel: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport, strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}
