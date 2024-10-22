//
//  PurchaseSendInformationModel.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/10/24.
//

import Foundation

public struct PurchaseSendInformationModel: Codable, Hashable {

    var orderNum: String
    var arriveDate: String
    var productName: String
    var productCost: String
    var productFood: String
    var productImage: String

    enum CodingKeys: String, CodingKey {
        case orderNum = "numero_pedido"
        case arriveDate = "fecha_entrega"
        case productName = "nombre_producto"
        case productCost = "precio_producto"
        case productFood = "pie_producto"
        case productImage = "imagen_producto"
    }
    
}

struct PurchaseSendInformationRequestModel: Codable {
    var calle, cp, colonia, delegacion, ciudad, referencias, telefono, id_user: String
    var id_producto, monto, id_transaccion, codigo_referencia: String
}
