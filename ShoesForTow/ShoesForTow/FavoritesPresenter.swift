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
  @Published var data: [ImageGridModel] = []
  var cancellables: Set<AnyCancellable> = .init()

  init() {
    getData()
  }

  func getData() {
    isLoading = true
    service.getData()
      .sink { [weak self] completion in
        self?.isLoading = false
      } receiveValue: { [weak self] response in
     //   self?.data = response.data
      }
      .store(in: &cancellables)
  }
}
