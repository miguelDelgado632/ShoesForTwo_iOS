//
//  UserDefaults+Extensions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 06/10/24.
//

import Foundation

extension UserDefaults {
    func setIdUser(for id: String) {
        set(id, forKey: UserDefaultsKeys.userID.rawValue)
    }
    
    func getUserID() -> String{
        return string(forKey: UserDefaultsKeys.userID.rawValue) ?? ""
    }
}

enum UserDefaultsKeys : String {
    case userID
}
