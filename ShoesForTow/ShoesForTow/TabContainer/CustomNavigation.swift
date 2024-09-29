//
//  Navigation.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation

final class ShoesForTwoNavigation: ObservableObject {
  @Published var isLikesViewActive: Bool = false
  @Published var isMatchViewAcive: Bool = false
  @Published var isProfileViewActive: Bool = false
  @Published var shouldShowTabHomeView: Bool = false

  func updateActiveView(_ tag: Int) {
    switch tag {
    case 1:
      isLikesViewActive = false
    case 2:
      isMatchViewAcive = false
    case 3:
      isProfileViewActive = false
    default: break
    }
  }

  func resetValues() {
    isLikesViewActive = false
    isMatchViewAcive = false
    isProfileViewActive = false
    shouldShowTabHomeView = false
  }
}
