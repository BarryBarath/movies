//
//  UserDefaults+Ext.swift
//  Movies
//
//  Created by develop on 27/09/22.
//

import Foundation


struct UserDefaultsKey {
    static let  authtoken = "authToken"
}


extension UserDefaults {
    static func getAuthToken() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKey.authtoken)
    }
    
    static func storeAuthToken(withToken token: String) {
        UserDefaults.standard.set(token, forKey: UserDefaultsKey.authtoken)
    }
}
