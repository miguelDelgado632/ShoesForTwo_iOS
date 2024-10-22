//
//  PurchaseSendInformationPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI
import Combine

final class PurchaseSendInformationPresenter: ObservableObject {

    private let service: PurchaseSendInformationServices = .init()

    @Published var isLoading: Bool = false
    @Published var showError: Bool = false

    @Published var addressNumber: String = ""
    @Published var postalCode: String = ""
    @Published var neighborhood: String = ""
    @Published var delegation: String = ""
    @Published var city: String = ""
    @Published var reference: String = ""
    @Published var cardNumber: String = ""
    @Published var cardName: String = ""
    @Published var date: String = ""
    @Published var cvv: String = ""
    
   // var invitationData: [InvitationsData] = []
    var cancellables: Set<AnyCancellable> = .init()
    var errorText: String = ""
    var productData: GuestUserInfo?
    
    init (productData: GuestUserInfo) {
        self.productData = productData
    }

    func getData(_ completion: @escaping (PurchaseSendInformationModel) -> Void) {
        let params = PurchaseSendInformationRequestModel(calle: addressNumber,
                                                         cp: postalCode,
                                                         colonia: neighborhood,
                                                         delegacion: delegation,
                                                         ciudad: city,
                                                         referencias: reference,
                                                         telefono: "",
                                                         id_user: UserDefaults().getUserID(),
                                                         id_producto: productData?.idProduct ?? "",
                                                         monto: productData?.costProduct ?? "",
                                                         id_transaccion: "",
                                                         codigo_referencia: "")
        isLoading = true
        service.getData(request: params)
            .sink { [weak self] completion in
                guard let self = self else { return }
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let failure):
                    if let error = failure as? NetworkError {
                        switch error {
                        case .invalidResponse(let errorRequest):
                            self.errorText = errorRequest.message
                        default:
                            break
                        }
                    }
                    self.handleError()
                }
            } receiveValue: { [weak self] info in
                guard let self = self else { return }
                if let response = info.data?.first {
                    completion(response)
                } else {
                    self.errorText = "Data nulo"
                    self.handleError()
                }
                isLoading = false
            }
            .store(in: &cancellables)
    }
    private func handleError() {
        showError = true
        isLoading = false
    }
    
}
