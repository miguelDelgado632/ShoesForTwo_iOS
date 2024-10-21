//
//  InvitationsModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/10/24.
//

import Foundation

struct InvitationsModel: Codable {
    var invitationsData: [InvitationsData]

    enum CodingKeys: String, CodingKey {
        case invitationsData = "invitaciones"
    }
}

struct InvitationsData: Codable, Hashable {
    var userId: String
    var name: String
    var productId: String
    var myProduct: [ProductsDataModel]
    var invitationProduct: [ProductsDataModel]

    enum CodingKeys: String, CodingKey {
        case userId = "id_user"
        case name = "nombre"
        case productId = "id_producto"
        case myProduct = "mi_producto"
        case invitationProduct = "producto_invitado"
    }
}

struct ProductsDataModel: Codable, Hashable {
    var productImage: String
    var name: String?
    var cost: String?

    enum CodingKeys: String, CodingKey {
        case productImage = "imagen_producto"
        case name = "nombre"
        case cost = "precio"
    }
}
