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
  case register(RegistrationRequestModel)

  // MARK: - MATCH
  case productsInfo(ProductsInfoRequestModel)
  case inviteMatch(LikesProductRequestModel)
  case sendInvitation(SendInvitationRequestModel)
  case purchaseInfo
  case paymentConfirmation
  case otherUserProfile
  case favorites(LikesProductRequestModel)

  //MARK: - PROFILE
  case profile
  case shoppingCart
  case myOrders
  case invitations

  var baseURL: URL {
    return URL(string: "https://proyectos-ddbmexico.com/Shoes/api/v1/index.php")!
  }

  var path: String {
    switch self {
    case .login:
      return "/login"
    case .register:
      return "/register"
    case .productsInfo:
      return "/productos"
    case .inviteMatch:
      return "/match"
    case .sendInvitation:
        return "/invite"
    case .purchaseInfo:
      return ""
    case .paymentConfirmation:
      return ""
    case .otherUserProfile:
      return ""
    case .favorites:
      return "/favoritos"
    case .profile:
      return ""
    case .shoppingCart:
      return ""
    case .myOrders:
      return ""
    case .invitations:
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
    case .register(let data):
        return convertToURLQueryItems(from: data)
    case .productsInfo(let data):
      return convertToURLQueryItems(from: data)
    case .favorites(let data):
      return convertToURLQueryItems(from: data)
    case .inviteMatch(let data):
      return convertToURLQueryItems(from: data)
    case .sendInvitation(let data):
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

