//
//  InvitationsServices.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/10/24.
//

import Foundation
import Combine

final class InvitationsServices {
    private let apiClient = URLSessionAPIClient<DataEndpoint>()

    func getData() -> AnyPublisher<Response<InvitationsModel>, Error> {
        apiClient.request(.invitations(LikesGridRequest(id_user: UserDefaults.standard.getUserID())))
            .eraseToAnyPublisher()
    }
}
