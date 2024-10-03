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
  @Published var showError: Bool = false
  var errorText: String = ""
  private var cancellables: Set<AnyCancellable> = .init()
  private let service: LoginService = .init()
    
   var checkValuesInTextField: Bool {
       email.isValidEmail && !password.isEmpty
    }
  func login(_ completion: @escaping () -> Void) {
    isLoading = true
      if checkValuesInTextField {
          service.login(data: LoginRequestModel(email: email, password: password))
              .subscribe(on: DispatchQueue.main)
              .sink(
                receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:
                        print("Finished")
                    case .failure(let failure):
                        if let error = failure as? NetworkError {
                            switch error {
                            case .invalidResponse(let errorRequest):
                                self?.errorText = errorRequest.message
                            default:
                                break
                            }
                        }
                        self?.handleError()
                    }
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
      } else {
         errorText = "Campos Invalidos"
         handleError()
          
      }
  }

  private func handleError() {
    showError = true
    isLoading = false
  }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
