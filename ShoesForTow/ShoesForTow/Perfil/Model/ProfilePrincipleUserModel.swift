//
//  ProfilePrincipleUserModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/10/24.
//

import Foundation

struct ProfilePrincipleUserModel: Codable {
    var profile: [PerfilTwoOtherUserData]

    enum CodingKeys: String, CodingKey {
        case profile = "perfil"
    }
}
