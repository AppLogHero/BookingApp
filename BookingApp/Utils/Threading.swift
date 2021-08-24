//
//  Threading.swift
//  BookingApp
//
//  Created by Julien Delferiere on 24/08/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation
import UIKit

//Executer du code dans l'UIthread
func executeOnUIThreadAsync(_ closure: @escaping () -> Void) {
    if( isMainThread()) {
        closure()
    } else {
        DispatchQueue.main.async(execute: {
            closure()
        })
    }
}

func executeOnUIThread(_ closure: @escaping () -> Void) {
    if( isMainThread()) {
        closure()
    } else {
        DispatchQueue.main.sync(execute: {
            closure()
        })
    }
}

func isMainThread() -> Bool {
    return Thread.isMainThread
}

func executeOnBackground(_ closure: @escaping () -> Void) {
    DispatchQueue.global(qos: DispatchQoS.QoSClass.background).async(execute: {
        closure()
    })
}

