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
  case likes(LikesGridRequest)
  case purchaseInfo(PurchaseSendInformationRequestModel)
  case paymentConfirmation
  case otherUserProfile(LikesGridRequest)
  case favorites(LikesProductRequestModel)

  //MARK: - PROFILE
  case profile(LikesGridRequest)
  case shoppingCart(LikesGridRequest)
  case myOrders
  case invitations(LikesGridRequest)

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
    case .likes:
        return "/likes"
    case .purchaseInfo:
      return "/compra"
    case .paymentConfirmation:
      return ""
    case .otherUserProfile:
      return "/perfilTwo"
    case .favorites:
      return "/favoritos"
    case .profile:
      return "/perfil"
    case .shoppingCart:
      return "/carrito"
    case .myOrders:
      return ""
    case .invitations:
      return "/invitaciones"
    }
  }

  var method: HTTPMethod {
    .post
  }

  var headers: [String: String]? {
    ["Content-Type": "application/json"]
  }

    var body: [String: Any]? {
        switch self {
        case .register(let data):
            return ["nombre": data.nombre,
                    "apellidos": data.apellidos,
                    "email": data.email,
                    "password": data.password,
                    "genero": data.genero,
                    "talla": data.talla,
                    "pie": data.pie,
                    "foto": data.foto]
        default:
            return nil
        }
    }

  var parameters: [URLQueryItem]? {
    switch self {
    case .login(let data):
      return convertToURLQueryItems(from: data)
    case .productsInfo(let data):
      return convertToURLQueryItems(from: data)
    case .favorites(let data):
      return convertToURLQueryItems(from: data)
    case .inviteMatch(let data):
      return convertToURLQueryItems(from: data)
    case .sendInvitation(let data):
      return convertToURLQueryItems(from: data)
    case .likes(let data):
      return convertToURLQueryItems(from: data)
    case .otherUserProfile(let data):
        return convertToURLQueryItems(from: data)
    case .profile(let data):
        return convertToURLQueryItems(from: data)
    case .shoppingCart(let data):
        return convertToURLQueryItems(from: data)
    case .invitations(let data):
        return convertToURLQueryItems(from: data)
    case .purchaseInfo(let data):
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

