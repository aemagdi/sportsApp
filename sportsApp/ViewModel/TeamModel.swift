//
//  TeamModel.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 25/06/2022.
//

import Foundation

class TeamsViewModel {
    var teamsArray: [Team]? {
        didSet {
            bindingData(teamsArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let teamApiService: TeamsApiService
    var bindingData: (([Team]?,Error?) -> Void) = {_, _ in }
    init(teamApiService: TeamsApiService = teamsNetworkManager() ) {
        self.teamApiService = teamApiService
    }
    func fetchData(endPoint: String) {
        teamApiService.fetchTeams(endPoint: endPoint) { teams, error in
            if let teams = teams {
                self.teamsArray = teams
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
