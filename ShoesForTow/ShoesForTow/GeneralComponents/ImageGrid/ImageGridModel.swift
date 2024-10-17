//
//  ImageGridModel.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation

struct ImageGridModel: Hashable, Codable {
    let image: String
    let title: String
    let subTitle: String?
}

struct LikeUsersModel: Hashable, Codable {
    let likes: [LikesGridModel]
}

struct LikesGridModel: Hashable, Codable {
    var idUser: String
    var idProduct: String
    var name: String
    var cost: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        case idUser = "id_user"
        case idProduct = "id_producto"
        case name = "nombre"
        case cost = "precio"
        case image = "imagen_producto"
    }
}

struct LikesGridRequest: Codable {
    var id_user: String
}

extension [ImageGridModel] {
  static func testData(numOfData: Int = 10) -> Self {
    var data: [ImageGridModel] = []
    for i in 1...numOfData {
      data.append(ImageGridModel(
        image: "\(i)",
        title: "\(i)",
        subTitle: "$\(i)")
      )
    }
    return data
  }
}
