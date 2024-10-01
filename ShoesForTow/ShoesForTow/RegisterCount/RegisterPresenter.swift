//
//  RegisterPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI
import Combine

final class RegisterPresenter: ObservableObject {

  @Published var name: String = ""
  @Published var apellido: String = ""
  @Published var email: String = ""
  @Published var password: String = ""
  @Published var selectedGender: String = ""
  @Published var shoesSize: String? = nil
  @Published var selectedImage: UIImage?
  @Published var checkTermisAndConditios: Bool = false
  @Published var isLoading: Bool = false

  private let service: RegistrationService = .init()
  private var cancellables: Set<AnyCancellable> = .init()

  init() { }

  func register() {
    let data: RegistrationRequestModel = .init(
      name: name,
      apellido: apellido,
      email: email,
      password: password,
      selectedGender: selectedGender,
      checkTermisAndConditios: checkTermisAndConditios
    )

    isLoading = true
    service.register(data: data)
      .subscribe(on: RunLoop.main)
      .sink { [weak self] completion in
        self?.isLoading = false
      } receiveValue: { response in
        // TODO: HANDLE RESPONSE
      }
      .store(in: &cancellables)
  }
}
