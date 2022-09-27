//
//  Toaster.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation
import Toaster


class Toaster {
    
    static let instance = Toaster()
    
    private init() { }
    
    func showToast(msg: String){
        Toast(text: msg, delay: 0.1, duration: Delay.short).show()
    }
    
}
