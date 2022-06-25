//
//  upcomingEvents.swift
//  sportsApp
//
//  Created by Abdelrahman Magdy on 23/06/2022.
//

import Foundation

class EventsViewModel {
    var eventsArray: [Event]? {
        didSet {
            bindingData(eventsArray,nil)
        }
    }
    var error: Error? {
        didSet {
            bindingData(nil, error)
        }
    }
    let eventApiService: UpcomingEventsApiService
    var bindingData: (([Event]?,Error?) -> Void) = {_, _ in }
    init(eventApiService: UpcomingEventsApiService = EventNetworkManager()) {
        self.eventApiService = eventApiService
    }
    func fetchData(endPoint: String) {
        eventApiService.fetchEvents(endPoint: endPoint) { events, error in
            if let events = events {
                self.eventsArray = events
            }
            if let error = error {
                self.error = error
            }
        }
    }
}
