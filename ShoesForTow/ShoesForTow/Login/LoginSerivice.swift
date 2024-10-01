//
//  LoginSerivice.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 01/10/24.
//

import Foundation
import Combine

final class LoginService {
  typealias LoginResponse = Response<LoginResponseModel>

  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func login(data: LoginRequestModel) -> AnyPublisher<LoginResponse, Error> {
    apiClient.request(.login(data))
  }
}
