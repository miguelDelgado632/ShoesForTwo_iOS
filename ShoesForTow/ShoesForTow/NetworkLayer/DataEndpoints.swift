//
//  DataEndpoints.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 30/09/24.
//

import Foundation

enum DataEndpoint: APIEndpoint {
  // MARK: - LOGIN
  case login
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
    return URL(string: "https://lineguide.mx/api/v1/index.php")!
  }

  var path: String {
    switch self {
    case .login:
      return ""
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
    nil // TODO: REMOVE NIL FOR REAL SERVICE
//    switch self {
//    case .register(let data):
//      return convertToURLQueryItems(from: data)
//    case .business(let data):
//      return convertToURLQueryItems(from: data)
//    case .businessId(let data):
//      return convertToURLQueryItems(from: data)
//    case .businessDetail(let data):
//      return convertToURLQueryItems(from: data)
//    case .saveFavorite(let data):
//      return convertToURLQueryItems(from: data)
//    case .save(let data):
//      return convertToURLQueryItems(from: data)
//    case .saveBusinessCategory(let data):
//      return convertToURLQueryItems(from: data)
//    }
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

