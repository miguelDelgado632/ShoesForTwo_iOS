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
    apiClient.request(.productsInfo(ProductsInfoRequestModel(userId: "", filterType: type.rawValue)))
      .eraseToAnyPublisher()
  }
}


struct ProductsInfoRequestModel: Encodable {
  let userId: String
  let filterType: Int

  enum CodingKeys: String, CodingKey {
    case userId = "user_id"
    case filterType = "tipo"
  }
}
