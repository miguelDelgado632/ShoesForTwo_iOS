//
//  RegistrationModels.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import Foundation


struct RegistrationRequestModel: Encodable {
  var nombre: String
  var apellidos: String
  var email: String
  var password: String
  var genero: Int
  var talla: String
  var pie: Int
  var foto: String
}

struct RegistrationResponseModel: Codable {
    var idUser: String
    var photo: String


    enum CodingKeys: String, CodingKey {
      case idUser = "id_user"
      case photo = "foto"
    }
}
