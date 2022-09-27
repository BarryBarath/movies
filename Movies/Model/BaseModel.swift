//
//  BaseModel.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation
import SwiftyJSON

struct BaseModel: BaseSwiftyJSON {
    
    var message: String = String()
    var moviesList : [MovieListModel] = [MovieListModel]()
    
    
    init() { }
    
    init(json: JSON) {
        self.message = json["message"].string ?? String()
        let moviesArray = json["results"].array
        let moviesList = moviesArray?.compactMap({ (jsonVal) -> MovieListModel? in
            return MovieListModel.init(json: jsonVal)
        })
        self.moviesList = moviesList ?? [MovieListModel]()
    }
    
}


struct Errormodel: Error {
    var messsage : String = String()
    var statusCode : Int = Int()
    
    init() {}
    init(json: JSON) {
        messsage = json["message"].string ?? String()
    }
}
