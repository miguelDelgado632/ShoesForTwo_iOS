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
  @Published var likesFromUser: [Bool] = []
  @Published var users: [ShoeProductFavorite] = []
  @Published var isLoading: Bool = false
  @Published var showError: Bool = false
  @Published var productId: String = ""

  private var currentFilter: HomeMatchFilterType = .all
  private var cancellables: Set<AnyCancellable> = .init()
  private let service: HomeMatchService = .init()

  var errorText: String = ""
 

  init() {
    getData()
  }

  func filterBy(_ type: HomeMatchFilterType) {
    currentFilter = type
    getData()
  }

  private func setupObservers() {
    $currentSelection
      .sink { newValue in
          if !self.shoeProducts[newValue].favorites.isEmpty {
              let otherUsers = self.shoeProducts[newValue].favorites//.compactMap({ $0.userId })
              self.users = otherUsers
          }
        self.productId = self.shoeProducts[newValue].product.productId
        self.addOrRemoveUserIconOfFavorites(status: self.likesFromUser[newValue])
      }
      .store(in: &cancellables)
  }

    func addOrRemoveUserIconOfFavorites(status: Bool) {
      
         if status {
             let currentUser = ShoeProductFavorite(productId: self.productId, userId: UserDefaults.standard.getUserID(), picture: UserDefaults.standard.getUserPhoto())
             self.users = self.users.filter( { $0.userId != currentUser.userId })
             self.users.append(currentUser)
         } else {
             let currentUser = ShoeProductFavorite(productId: self.productId, userId: UserDefaults.standard.getUserID(), picture: UserDefaults.standard.getUserPhoto())
             self.users = self.users.filter( { $0.userId != currentUser.userId })
         }

    }

  func fetchLikes() {
      service.fectchLikes(idProduct: productId)
          .receive(on: DispatchQueue.main)
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
          } receiveValue: { [weak self] shoeProducts in
              guard let self = self else { return }
              let valueChange = self.likesFromUser[self.currentSelection]
              self.likesFromUser[self.currentSelection] = !valueChange
              print("este es mi m2 con servicio like \(self.likesFromUser)")
              setupObservers()
          }
          .store(in: &cancellables)
  }

  private func getData() {
    isLoading = true
    service.getData(filter: currentFilter)
      .receive(on: DispatchQueue.main)
      .compactMap { $0.data?.mapToShoeProductElementModel() }
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
        self.isLoading = false
      } receiveValue: { [weak self] shoeProducts in
        guard let self = self else { return }
        self.shoeProducts = shoeProducts
        self.likesFromUser = shoeProducts.map { !$0.likesId.isEmpty }
          print("este es mi m2 con solo un map \(self.likesFromUser)")
        self.setupObservers()
        self.isLoading = false
      }
      .store(in: &cancellables)
  }

    private func handleError() {
      showError = true
      isLoading = false
    }
}
