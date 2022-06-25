//
//  upcomingEventsNetworkManager.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 23/06/2022.
//

import Foundation

class EventNetworkManager: UpcomingEventsApiService {
    func fetchEvents(endPoint: String, completion: @escaping (([Event]?, Error?) -> Void)) {
        // fetching data
        if let  url = URL(string: UrlServices(endPoint: endPoint).url) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let data = data {
                    
                    guard let decodedData = try? JSONDecoder().decode(EventModel.self, from: data) else{ return}
                    completion(decodedData.events,nil)
                    print("event data is here")
                }
                if let error = error {
                   completion(nil, error)
                }
            }.resume()
        }

    }
}
