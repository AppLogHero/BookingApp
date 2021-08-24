//
//  HTTPService.swift
//  BookingApp
//
//  Created by Julien Delferiere on 23/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

struct HTTPErrorResponse: Error {
    var code: Int? = nil
    var data: Data? = nil
    var message: String? = nil
}

struct HTTPService {
    
    func request<T : Codable>(_ request: URLRequest) throws -> T? {
        
        if isMainThread() {
            Logging.error("***********************************************")
            Logging.error("URL Request called in main thread! url = \(String(describing: request.url?.absoluteString))")
            Logging.error("***********************************************")
        }
            
        var responseResult : T?
        var errorResult : Error?
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                Logging.error("\(error.debugDescription)")
                errorResult = HTTPErrorResponse(message: "Received nil response from backend, error = \(String(describing: error))")
                semaphore.signal()
                return
            }
            
            Logging.debug("Backend response received for: \(String(describing: response.url?.absoluteString))\n ==> HTTP code = \(response.statusCode)\n Result =\(String(data: data, encoding: .utf8) ?? "(null)")")
            
            switch response.statusCode {
            case 200...299:
                do {
                    responseResult = try JSONDecoder().decode(T.self, from: data)
                    Logging.verbose("Json object created from JSONDecoder => \(responseResult.debugDescription)")
                    semaphore.signal()
                } catch {
                    Logging.error("Error while parsing backend response ==> \(error)")
                    errorResult = HTTPErrorResponse(message: "Can't parse json reponse from backend")
                    semaphore.signal()
                }
            default:
                Logging.error("Received code from backend different from 2XX, unable to parse response ")
                errorResult = HTTPErrorResponse(code: response.statusCode, message: (String(data: data, encoding: .utf8)))
                semaphore.signal()
            }
        
        }
        
        Logging.info("Calling HTTP request : \(request.url?.absoluteString ?? "(null)")")
        
        task.resume()
        semaphore.wait()
        
        if(errorResult != nil){
            throw errorResult!
        }
        return responseResult
        
    }

}

