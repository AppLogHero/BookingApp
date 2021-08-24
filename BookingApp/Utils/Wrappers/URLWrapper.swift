//
//  URLWrapper.swift
//  BookingApp
//
//  Created by Julien Delferiere on 24/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

@propertyWrapper struct Url {
    
    let stringValue: String
    
    var wrappedValue: URL? {
        didSet {
            wrappedValue = URL(string: stringValue)
        }
    }
    
}
