//
//  OtherUserProfilePresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/10/24.
//

import Foundation
import SwiftUI
import Combine

final class OtherUserProfilePresenter: ObservableObject {
    
    private let service: OtherUserProfileService = .init()
    
    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var likes: [LikesGridModel] = []
    @Published var profileData: PerfilTwoOtherUserData?
    var cancellables: Set<AnyCancellable> = .init()
    var errorText: String = ""
    
    
    init(userIdOtherProfile: String) {
        getData(userIdOtherProfile: userIdOtherProfile)
    }
    
    func getData(userIdOtherProfile: String) {
        isLoading = true
        service.getData(userIdOtherProfile: userIdOtherProfile)
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
            } receiveValue: { [weak self] otherUserData in
                guard let self = self else { return }
                self.profileData = otherUserData.data?.perfilTwo.first
                self.likes = otherUserData.data?.perfilTwo.first?.likes ?? []
                isLoading = false
            }
            .store(in: &cancellables)
    }
    private func handleError() {
        showError = true
        isLoading = false
    }
}
