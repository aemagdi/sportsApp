//
//  NetworkManager.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 20/06/2022.
//

import Foundation

class NetworkManager: ApiService {
    func fetchSports(endPoint: String, completion: @escaping (([Sport]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    guard let decodedData = try? JSONDecoder().decode(SportModel.self, from: data) else{ return}
                    completion(decodedData.sports,nil)
                    print("data is here")
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}


//
//let decodedArray:[Sport] = convertFromJson(data: data) ?? []
//completion(decodedArray,nil)
//print("data is here")
//                    completion(decodedArray,nil)
