//
//  DataEndpoints.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 30/09/24.
//

import Foundation

enum DataEndpoint: APIEndpoint {
  // MARK: - LOGIN
  case login(LoginRequestModel)
  case register

  // MARK: - MATCH
  case shoesInfo
  case inviteMatch
  case purchaseInfo
  case paymentConfirmation
  case otherUserProfile
  case likes

  //MARK: - PROFILE
  case profile
  case shoppingCart
  case myOrders
  case intications

  var baseURL: URL {
    return URL(string: "https://proyectos-ddbmexico.com/Shoes/api/v1/index.php")!
  }

  var path: String {
    switch self {
    case .login:
      return "/login"
    case .register:
      return ""
    case .shoesInfo:
      return ""
    case .inviteMatch:
      return ""
    case .purchaseInfo:
      return ""
    case .paymentConfirmation:
      return ""
    case .otherUserProfile:
      return ""
    case .likes:
      return ""
    case .profile:
      return ""
    case .shoppingCart:
      return ""
    case .myOrders:
      return ""
    case .intications:
      return ""
    }
  }

  var method: HTTPMethod {
    .post
  }

  var headers: [String: String]? {
    ["Content-Type": "application/json"]
  }

  var parameters: [URLQueryItem]? {
    switch self {
    case .login(let data):
      return convertToURLQueryItems(from: data)
    default:
      return nil
    }
  }

  private func convertToURLQueryItems<T: Encodable>(from encodable: T) -> [URLQueryItem]? {
    let encoder = JSONEncoder()

    do {
      let encodedData = try encoder.encode(encodable)
      let jsonObject = try JSONSerialization.jsonObject(with: encodedData, options: [])

      if let dictionary = jsonObject as? [String: Any] {
        let queryItems = dictionary.map { key, value in
          return URLQueryItem(name: key, value: "\(value)")
        }
        return queryItems
      }
    } catch {
      print("Encoding error:", error)
    }
    return nil
  }
}

