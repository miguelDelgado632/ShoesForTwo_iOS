//
//  MatchService.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 09/10/24.
//

import Foundation
import Combine

final class MatchService {
    private let apiClient = URLSessionAPIClient<DataEndpoint>()
    

    func getData(idProduct: String) -> AnyPublisher<Response<UsersMatchModel>, Error> {
        apiClient.request(.inviteMatch(LikesProductRequestModel(userId: UserDefaults.standard.getUserID(), idProducto: idProduct)))
        .eraseToAnyPublisher()
    }
}
