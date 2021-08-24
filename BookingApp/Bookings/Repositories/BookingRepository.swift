//
//  BookingRepository.swift
//  BookingApp
//
//  Created by Julien Delferiere on 24/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

struct RepositoryError: Error {
    var message: String?
}

protocol BookingRepository {
    func getBookings(_ maxBooking: Int) -> Result<[Booking]?, Error>
}

struct BookingDataRepository: BookingRepository {
    
    let httpService: HTTPService
    
    init(httpService: HTTPService) {
        self.httpService = httpService
    }
    
    func getBookings(_ maxBooking: Int) -> Result<[Booking]?, Error> {
        
        @Url(stringValue: "https://randomuser.me/api/") var baseURL
        
        guard let baseURL = baseURL else {
            return .failure(RepositoryError(message: "baseURL is nil"))
        }
        
        @URLRequestBuilder(verb: "", httpMethod: .GET, baseURL: baseURL, parameters: ["results": "XXX"]) var urlRequest
        
        guard let urlResquest = urlRequest else {
            return .failure(RepositoryError(message: "Fail to build urlRequest with URLRequestBuilder"))
        }
        
        do {
            let bookings: [Booking]? = try httpService.request(urlResquest)
            return .success(bookings)
        } catch {
            if let error = error as? HTTPErrorResponse {
                Logging.error(error.message ?? "")
                return .failure(error)
            } else {
                Logging.error(error.localizedDescription)
                return .failure(error)
            }
        }
    }
    
}

struct BookingMockedRespository: BookingRepository {
    
    func getBookings(_ maxBooking: Int) -> Result<[Booking]?, Error> {
        return .success(Array(repeating: Booking(), count: maxBooking))
    }
    
}
