//
//  RegistrationService.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 01/10/24.
//

import Foundation
import Combine

final class RegistrationService {
  typealias RegistrationResponse = Response<RegistrationResponseModel>
  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func register(data: RegistrationRequestModel) -> AnyPublisher<RegistrationResponse, Error> {
    Just(
      Response(
        status: 200,
        message: nil,
        data: RegistrationResponseModel(
          status: 200
        )
      )
    )
    .setFailureType(to: Error.self)
    .eraseToAnyPublisher()
  }
}


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
