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
