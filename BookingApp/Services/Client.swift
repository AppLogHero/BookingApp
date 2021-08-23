//
//  Client.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import Foundation

class Client {
    func getBookings(_ maxBooking: Int) -> [Booking] {
        // Call API GET to https://randomuser.me/api/?results=XXX to retrieve an array of User.
        // Then create an array of bookings from the array of users
        return Array(repeating: Booking(),
                     count: maxBooking)
    }
}
