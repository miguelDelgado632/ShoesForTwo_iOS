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
  var status: Int
  var message: String
  var data: [RegistrationDataModel]
}

struct RegistrationDataModel: Codable {
  let idUser: String

  enum CodingKeys: String, CodingKey {
    case idUser = "id_user"
  }
}
