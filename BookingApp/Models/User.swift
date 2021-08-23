//
//  User.swift
//  BookingApp
//
//  Created by Zenchef on 03/05/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

struct User {
    var firstName: String = "John"
    var lastName: String = "Doe"
    var gender: Gender = .male
    var email: String?
    var phone: String?
}

enum Gender: String {
    case male
    case female
}
