//
//  UIViewController + Ext.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    class var identifier: String {
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appstoryboard: AppStoryboard) -> Self {
        return appstoryboard.viewController(vc: self)
    }
    
}
