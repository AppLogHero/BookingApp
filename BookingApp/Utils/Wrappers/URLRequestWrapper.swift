//
//  URLRequestWrapper.swift
//  BookingApp
//
//  Created by Julien Delferiere on 24/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case GET
    case POST
    case PUT
    case DELETE
}

@propertyWrapper struct URLRequestBuilder {
    
    let verb: String
    let httpMethod: HTTPMethod
    
    var baseURL: URL
    var parameters: [String: String]? = nil
    var jsonData: Data? = nil
    
    var wrappedValue: URLRequest? {
        get {
            var configuredURL = URLComponents(url: baseURL.appendingPathComponent(verb), resolvingAgainstBaseURL: false)
            configuredURL?.queryItems = parameters?.compactMap({ (name, value) in
                return URLQueryItem(name: name, value: value)
            })
            
            guard let url = configuredURL?.url else {
                Logging.error("Error fetch configured URL for URLRequestBuilder")
                return nil
            }
            
            var request = URLRequest(url: url)
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod  = httpMethod.rawValue
            request.httpBody = jsonData
            
            return request
        }
    }
    
}
