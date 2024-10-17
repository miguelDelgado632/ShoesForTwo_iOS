//
//  FavoritesService.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import Combine
import Foundation

final class FavoritesService {
  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func getData() -> AnyPublisher<Response<LikeUsersModel>, Error> {
      apiClient.request(.likes(LikesGridRequest(id_user: UserDefaults.standard.getUserID())))
          .eraseToAnyPublisher()
  }
}
