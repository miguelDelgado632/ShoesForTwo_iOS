//
//  OtherUserProfileService.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/10/24.
//

import Combine
import Foundation

final class OtherUserProfileService {
  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func getData(userIdOtherProfile: String) -> AnyPublisher<Response<OtherUserProfileModel>, Error> {
      apiClient.request(.otherUserProfile(LikesGridRequest(id_user: userIdOtherProfile)))
          .eraseToAnyPublisher()
  }
}
