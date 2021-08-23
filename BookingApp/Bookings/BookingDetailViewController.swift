//
//  BooingDetailTableViewController.swift
//  BookingApp
//
//  Created by Zenchef on 21/08/2018.
//  Copyright © 2018 zenchef. All rights reserved.
//

import UIKit

class BookingDetailViewController: UIViewController {
    
    private var booking: Booking?

    init(booking: Booking?) {
        self.booking = booking
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .purple
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        label.center = self.view.center
        label.textColor = booking?.status.color
        label.text = booking?.user.firstName
        self.view.addSubview(label)
    }
}
