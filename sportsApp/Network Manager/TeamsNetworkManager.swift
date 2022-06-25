//
//  TeamsNetworkManager.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//

import Foundation

class teamsNetworkManager: TeamsApiService {
    func fetchTeams(endPoint: String, completion: @escaping (([Team]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    
                    guard let decodedData = try? JSONDecoder().decode(TeamModel.self, from: data) else{ return}
                    completion(decodedData.teams,nil)
                    print("teams data is here")
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}
