//
//  LeaguesModel.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 21/06/2022.
//

import Foundation

class LeaguesViewModel {
    var leaguesArray: [League]? {
        didSet {
            bindingData(leaguesArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let leagueApiService: LeaguesApiService
    var bindingData: (([League]?,Error?) -> Void) = {_, _ in }
    init(leagueApiService: LeaguesApiService = LeagueNetworkManager()) {
        self.leagueApiService = leagueApiService
    }
    func fetchData(endPoint: String) {
        leagueApiService.fetchLeagues(endPoint: endPoint) { leagues, error in
            if let leagues = leagues {
                self.leaguesArray = leagues
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
