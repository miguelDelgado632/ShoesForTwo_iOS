//
//  Models.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 01/10/24.
//

import Foundation

struct Response<T: Codable>: Codable {
  let status: Int
  let message: String?
  let data: T
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