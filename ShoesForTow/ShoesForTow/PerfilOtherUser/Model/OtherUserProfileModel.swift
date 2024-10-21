//
//  OtherUserProfileModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/10/24.
//

import Foundation

struct OtherUserProfileModel: Codable {
    var perfilTwo: [PerfilTwoOtherUserData]
    
}

struct PerfilTwoOtherUserData: Codable {
    var idUser: String
    var name: String
    var size: String
    var food: String
    var photo: String
    var likes: [LikesGridModel]?

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case name = "nombre"
        case size = "talla"
        case food = "pie"
        case photo = "foto"
        case likes
    }
}
