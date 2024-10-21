//
//  CarShopService.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/10/24.
//

import Foundation
import Combine

final class CarShopService {
    private let apiClient = URLSessionAPIClient<DataEndpoint>()
    
    func getData() -> AnyPublisher<Response<CarShopModel>, Error> {
        apiClient.request(.shoppingCart(LikesGridRequest(id_user: UserDefaults.standard.getUserID())))
            .eraseToAnyPublisher()
    }
}
