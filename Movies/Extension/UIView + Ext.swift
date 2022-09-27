//
//  UIView + Ext.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation
import UIKit

extension UIView {
    
    func  addTap(action : @escaping ()->Void ){
        let tap = MyTapGestureRecognizer(target: self , action: #selector(self.handleTap(_:)))
        tap.action = action
        tap.numberOfTapsRequired = 1
        self.addGestureRecognizer(tap)
        self.isUserInteractionEnabled = true
        
    }
    
    @objc func handleTap(_ sender: MyTapGestureRecognizer) {
        sender.action!()
    }
    
    class MyTapGestureRecognizer: UITapGestureRecognizer {
        var action : (()->Void)? = nil
    }
    
}
