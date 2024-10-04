//
//  LoginModels.swift.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 01/10/24.
//

import Foundation

struct Response<T: Codable>: Codable {
  let status: Int
  let message: String?
  let data: T?
}

// MARK: - RESPONSE
struct LoginResponseModel: Codable {
  let idUser: String

  enum CodingKeys: String, CodingKey {
    case idUser = "id_user"
  }
}

// MARK: REQUEST
struct LoginRequestModel: Encodable {
  let email: String
  let password: String
}


struct Test1: Codable {
    var status: Int
    var message: String
    var data: [test3]
}

struct test3: Codable {
    var id_user: String
}
