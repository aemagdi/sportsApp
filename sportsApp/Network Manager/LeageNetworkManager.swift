//
//  LeageNetworkManager.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 21/06/2022.
//

import Foundation

class LeagueNetworkManager: LeaguesApiService {
    func fetchLeagues(endPoint: String, completion: @escaping (([League]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    
                    guard let decodedData = try? JSONDecoder().decode(LeagueModel.self, from: data) else{ return}
                    completion(decodedData.countries,nil)
                    print("league data is here")
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}
