//
//  SendInvitationResponseModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 11/10/24.
//

import Foundation

struct SendInvitationResponseModel: Codable {
    var invite: [GuestUsersData]
}

struct GuestUsersData: Codable {
    var userOne: GuestUserInfo
    var userTwo: GuestUserInfo

    enum CodingKeys:  String, CodingKey {
        case userOne = "user_one"
        case userTwo = "user_two"
        
    }
}

public struct GuestUserInfo: Codable, Hashable {
    var idProduct: String
    var nameProdcut: String
    var costProduct: String
    var imgProduct: String
    var idUser: String
    var name: String
    var productFoot: String?
    var photo: String

    enum CodingKeys: String, CodingKey {
        case idProduct = "id_producto"
        case nameProdcut = "nombre_producto"
        case costProduct = "precio_producto"
        case imgProduct = "imagen_producto"
        case idUser = "id_user"
        case name = "nombre"
        case productFoot = "pie_producto"
        case photo = "foto"
    }
}
