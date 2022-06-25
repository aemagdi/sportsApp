//
//  ApiServices.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 20/06/2022.
//

import Foundation
protocol ApiService {
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void))
}

protocol LeaguesApiService {
    func fetchLeagues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void))
}

protocol UpcomingEventsApiService {
    func fetchEvents(endPoint: String, completion: @escaping (([Event]?, Error?) -> Void))
}

protocol TeamsApiService {
    func fetchTeams(endPoint: String, completion: @escaping (([Team]?, Error?) -> Void))
}

