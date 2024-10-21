//
//  HomeMatchService.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 04/10/24.
//

import Foundation
import Combine

final class HomeMatchService {

  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func getData(filter type: HomeMatchFilterType) -> AnyPublisher<Response<ShoeProductModel>, Error> {
      apiClient.request(.productsInfo(ProductsInfoRequestModel(function: "home", userId: UserDefaults.standard.getUserID(), filterType: type.rawValue, idProduct: "0")))
      .eraseToAnyPublisher()
  }

    func fectchLikes(idProduct: String) -> AnyPublisher<Response<ShoeProductModel>, Error> {
        apiClient.request(.favorites(LikesProductRequestModel(userId: UserDefaults.standard.getUserID(), idProducto: idProduct)))
        .eraseToAnyPublisher()
    }
}


struct ProductsInfoRequestModel: Encodable {
  let function: String
  let userId: String
  let filterType: Int
  let idProduct: String

  enum CodingKeys: String, CodingKey {
    case function = "funcion"
    case userId = "id_user"
    case filterType = "tipo"
    case idProduct = "id_producto"
  }
}

// MARK: - LIKES RESPONSE

struct LikesProductRequestModel: Encodable {
  let userId: String
  let idProducto: String

  enum CodingKeys: String, CodingKey {
    case userId = "id_user"
    case idProducto = "id_producto"
  }
}

