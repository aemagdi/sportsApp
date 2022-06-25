//
//  Urls.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 20/06/2022.
//

import Foundation

struct UrlServices {
    var endPoint: String = ""
    var url: String {
        return "https://www.thesportsdb.com/api/v1/json/2/\(endPoint)"
    }
}


//https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?s=soccer
//https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id=\(leagueID)
//https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(leagueName)
//search_all_teams.php?l=\(leagueName)

//https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=\(leagueName)

