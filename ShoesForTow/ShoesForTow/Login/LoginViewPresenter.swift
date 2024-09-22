//
//  LoginViewPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation

final class LoginViewPresenter: ObservableObject {
  @Published var navigation: ShoesForTwoNavigation = .init()

  func showHomeScreen() {
    navigation.shouldShowTabHomeView = true
  }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
