//
//  HomeFavoritesPresenter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import Foundation
import Combine

final class HomeFavoritesPresenter: ObservableObject {
  enum FilterType {
    case casual
    case formal
    case all
  }

  @Published var currentSelection: Int = 0
  @Published var shoes: [Shoe] = Shoe.mockedData()
  @Published var users: [String] = []

  private var cancellables: Set<AnyCancellable> = .init()

  init() {
    setupObservers()
  }

  func filterBy(_ type: FilterType) {
    switch type {
    case .casual:
      print(type)
    case .formal:
      print(type)
    case .all:
      print(type)
    }
  }

  private func setupObservers() {
    $currentSelection
      .sink { newValue in
        self.users = self.shoes[newValue].users
      }
      .store(in: &cancellables)
  }
}
