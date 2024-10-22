//
//  PurchaseSendInformationServices.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/10/24.
//

import Foundation
import Combine

final class PurchaseSendInformationServices {

    private let apiClient = URLSessionAPIClient<DataEndpoint>()

    func getData(request: PurchaseSendInformationRequestModel) -> AnyPublisher<Response<[PurchaseSendInformationModel]>, Error> {
        apiClient.request(.purchaseInfo(request))
            .eraseToAnyPublisher()
    }
    
}
