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
    var leftImage: String
    var rightImage: String
    var name: String
    var productId: String
    var productName: String

    enum CodingKeys: String, CodingKey {
        case leftImage = "imagen_left"
        case rightImage = "imagen_right"
        case name = "nombre"
        case productId = "id_producto"
        case productName = "nombre_producto"
    }
}

