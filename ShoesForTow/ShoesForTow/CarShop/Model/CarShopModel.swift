//
//  CarShopModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/10/24.
//

import Foundation

struct CarShopModel: Codable {
    var carrito: [CarsShopData]
}

struct CarsShopData: Codable, Hashable {
    var idUser: String
    var idProduct: String
    var name: String
    var cost: String
    var productImage: String

    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idProduct = "id_producto"
        case name = "nombre"
        case cost = "precio"
        case productImage = "imagen_producto"
    }
}
