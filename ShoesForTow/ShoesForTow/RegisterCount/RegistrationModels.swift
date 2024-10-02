//
//  RegistrationModels.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import Foundation


struct RegistrationRequestModel: Encodable {
  var name: String
  var apellido: String
  var email: String
  var password: String
  var selectedGender: String
  var shoesSize: String?
  var selectedImage: Data?
  var checkTermisAndConditios: Bool
}

struct RegistrationResponseModel: Codable {
  var status: Int
}
