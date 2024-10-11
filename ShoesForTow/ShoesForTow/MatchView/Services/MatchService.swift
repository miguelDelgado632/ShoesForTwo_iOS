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

    func sendInvitation(for data: SendInvitationRequestModel) -> AnyPublisher<Response<SendInvitationResponseModel>, Error> {
        apiClient.request(.sendInvitation(data))
            .eraseToAnyPublisher()
    }
}

struct SendInvitationRequestModel: Encodable {
    var id_user_one: String
    var id_producto_one: String
    var id_user_two: String
    var id_producto_two: String
}
