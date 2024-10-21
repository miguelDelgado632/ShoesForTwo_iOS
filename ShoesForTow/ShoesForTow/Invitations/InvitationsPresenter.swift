//
//  InvitationsPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI
import Combine

final class InvitationsPresenter: ObservableObject {

    private let service: InvitationsServices = .init()

    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    var invitationData: [InvitationsData] = []
    var cancellables: Set<AnyCancellable> = .init()
    var errorText: String = ""
    
    
    init() {
        getData()
    }

    func getData() {
        isLoading = true
        service.getData()
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
            } receiveValue: { [weak self] carShopData in
                guard let self = self else { return }
                self.invitationData = carShopData.data?.invitationsData ?? []
                isLoading = false
            }
            .store(in: &cancellables)
    }
    private func handleError() {
        showError = true
        isLoading = false
    }
}
