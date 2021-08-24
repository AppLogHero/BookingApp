//
//  Booking.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import Foundation
import UIKit

struct Booking: Codable {
    var user: User
    var status: BookingStatus = .waiting
    
    init(user: User = User()) {
        self.user = user
    }
}

enum BookingStatus: String, Codable {
    case waiting
    case cancel
    case confirmed
}

extension BookingStatus {
    var color: UIColor {
        switch self {
        case .waiting: return .orange
        case .cancel: return .red
        case .confirmed: return .green
        }
    }
}
