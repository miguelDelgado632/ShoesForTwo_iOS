//
//  ProfilePrincipleUserService.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/10/24.
//
import Combine
import Foundation

final class ProfilePrincipleUserService {
  private let apiClient = URLSessionAPIClient<DataEndpoint>()

  func getData() -> AnyPublisher<Response<ProfilePrincipleUserModel>, Error> {
      apiClient.request(.profile(LikesGridRequest(id_user: UserDefaults.standard.getUserID())))
          .eraseToAnyPublisher()
  }
}
