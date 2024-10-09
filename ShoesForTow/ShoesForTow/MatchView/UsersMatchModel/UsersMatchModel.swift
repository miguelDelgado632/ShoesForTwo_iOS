//
//  UsersMatchModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 09/10/24.
//

import Foundation

struct UsersMatchModel: Codable {
    var matches: [MatchesDataModel]
}

struct MatchesDataModel: Codable {
    
    var userOne: UserMatchDataModel
    var userTwo: UserMatchDataModel
    
    enum CodingKeys:  String, CodingKey {
        case userOne = "user_one"
        case userTwo = "user_two"
    }
}

struct UserMatchDataModel: Codable {
    var idProducto, productName, productCost, productImage, userId: String
    var name, photo: String
    
    enum CodingKeys:  String, CodingKey {
        case idProducto = "id_producto"
        case productName = "nombre_producto"
        case productCost = "precio_producto"
        case productImage = "imagen_producto"
        case userId = "id_user"
        case name = "nombre"
        case photo = "foto"
    }
}
