//
//  LoginViewPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation
import Combine

final class LoginViewPresenter: ObservableObject {
  @Published var isLoading: Bool = false
  @Published var email: String = ""
  @Published var password: String = ""
  private var cancellables: Set<AnyCancellable> = .init()
  private let service: LoginService = .init()

  func login(_ completion: @escaping () -> Void) {
    isLoading = true
    service.login(data: LoginRequestModel(email: email, password: password))
      .subscribe(on: RunLoop.main)
      .sink(
        receiveCompletion: { [weak self] completion in
          self?.isLoading = false
        },
        receiveValue: { [weak self] response in
          if response.status == 200 {
            completion()
          } else {
            self?.handleError()
          }
        }
      )
      .store(in: &cancellables)
  }

  private func handleError() {

  }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
