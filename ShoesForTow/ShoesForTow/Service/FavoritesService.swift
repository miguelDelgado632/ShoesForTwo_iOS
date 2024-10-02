//
//  FavoritesService.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import Combine

final class FavoritesService {
  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func getData() -> AnyPublisher<Response<[ImageGridModel]>, Error> {
    //    apiClient.request(.likes)
    let response = Response(status: 200,
                            message: nil,
                            data: [ImageGridModel].testData(numOfData: 30))
    return Just(response)
      .setFailureType(to: Error.self)
      .eraseToAnyPublisher()
  }
}
