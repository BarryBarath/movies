//
//  Resource.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation
import Alamofire
import SwiftyJSON


protocol BaseSwiftyJSON {
    
    init(json: JSON)
    
}
struct Resource<T: BaseSwiftyJSON> {
    
    let url: String
    var httpMethod: HTTPMethod = .get
    var params: Parameters? = nil
    
}
extension Resource {
    
    init(url: String) {
        self.url = url
    }
    
}
