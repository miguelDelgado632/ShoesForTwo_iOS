//
//  PerfilPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation
import Combine


final class PerfilPresenter: ObservableObject {

    private let service: ProfilePrincipleUserService = .init()
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var profileData: PerfilTwoOtherUserData?
    
    @Published var nameText: String = ""
    @Published var shoesSize: String? = nil
    @Published var shoes: String = ""
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
            } receiveValue: { [weak self] profileData in
                guard let self = self else { return }
                self.profileData = profileData.data?.profile.first
                self.nameText = self.profileData?.name ?? ""
                self.shoesSize = self.profileData?.size ?? ""
                self.shoes = self.profileData?.food ?? ""
                isLoading = false
            }
            .store(in: &cancellables)
    }
    
    private func handleError() {
        showError = true
        isLoading = false
    }

    func getEditData() {
        print("Edit")
    }
}
