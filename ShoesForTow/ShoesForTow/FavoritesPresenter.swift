//
//  FavoritesPresenter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import Foundation
import Combine

final class FavoritesPresenter: ObservableObject {

  private let service: FavoritesService = .init()

  @Published var isLoading: Bool = false
  @Published var showError: Bool = false
  @Published var likes: [LikesGridModel] = []
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
          } receiveValue: { [weak self] userLikes in
            guard let self = self else { return }
              self.likes = userLikes.data?.likes ?? []
              isLoading = false
          }
          .store(in: &cancellables)
  }
    private func handleError() {
      showError = true
      isLoading = false
    }
}
