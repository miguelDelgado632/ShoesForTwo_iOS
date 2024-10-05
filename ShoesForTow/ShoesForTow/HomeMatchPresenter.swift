//
//  HomeMatchPresenter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import Foundation
import Combine


enum HomeMatchFilterType: Int {
  case casual = 1
  case formal = 2
  case all = 3
}

final class HomeMatchPresenter: ObservableObject {

  @Published var currentSelection: Int = 0
  @Published var shoeProducts: [ShoeProductElementModel] = []
  @Published var users: [String] = []
  @Published var isLoading: Bool = false

  private var currentFilter: HomeMatchFilterType = .all
  private var cancellables: Set<AnyCancellable> = .init()
  private let service: HomeMatchService = .init()

  init() {
    getData()
  }

  func filterBy(_ type: HomeMatchFilterType) {
    currentFilter = type
  }

  private func setupObservers() {
    $currentSelection
      .sink { newValue in
        let otherUsers = self.shoeProducts[newValue].favorites.compactMap({ $0.userId })
        self.users = otherUsers
      }
      .store(in: &cancellables)
  }

  private func getData() {
    isLoading = true
    service.getData(filter: currentFilter)
      .receive(on: DispatchQueue.main)
      .compactMap { $0.data?.mapToShoeProductElementModel() }
      .sink { completion in
        self.isLoading = false
        self.shoeProducts = .mockedData() // TODO: - REMOVE THIS WHEN SUCCESS
      } receiveValue: { shoeProducts in
        self.shoeProducts = shoeProducts
        self.setupObservers()
      }
      .store(in: &cancellables)
  }
}
