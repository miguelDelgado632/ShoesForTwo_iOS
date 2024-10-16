//
//  UserDefaults+Extensions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 06/10/24.
//

import Foundation

extension UserDefaults {

// MARK: - Saving user id
    func setIdUser(for id: String) {
        set(id, forKey: UserDefaultsKeys.userID.rawValue)
    }
    
    func getUserID() -> String {
        return string(forKey: UserDefaultsKeys.userID.rawValue) ?? ""
    }

// MARK: - Saving user photo
    func setUserPhoto(for photo: String) {
        set(photo, forKey: UserDefaultsKeys.userPhoto.rawValue)
    }

    func getUserPhoto() -> String {
       return string(forKey: UserDefaultsKeys.userPhoto.rawValue) ?? ""
    }
}

enum UserDefaultsKeys : String {
    case userID
    case userPhoto
}
