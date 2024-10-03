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
  @Published var selectedGender: String = "" {
        didSet {
            shoesSize = nil
            showSizeShoes()
        }
    }
  @Published var shoesSize: String? = nil
  @Published var selectedImage: UIImage?
  @Published var checkTermisAndConditios: Bool = false
  @Published var isLoading: Bool = false
  @Published var shoesSizeNumbers: [String] = []
  @Published var showError: Bool = false

  private let service: RegistrationService = .init()
  private var cancellables: Set<AnyCancellable> = .init()
  private let sizeNumbers: SizeNumbersGender = .init()
  
  var errorText: String = ""

    var checkValuesInTextField: Bool {
        !name.isEmpty && !apellido.isEmpty && email.isValidEmail && !password.isEmpty && !selectedGender.isEmpty && checkTermisAndConditios && shoesSize != nil
    }

  init() { }

  func register(_ completion: @escaping () -> Void) {
      if checkValuesInTextField {
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
              .sink {  [weak self] completion in
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
              } receiveValue: { [weak self] response in
                  if response.status == 200 {
                      completion()
                  } else {
                      self?.handleError()
                  }
              }
              .store(in: &cancellables)
      } else {
          errorText = "Campos Invalidos"
      }
  }

    private func handleError() {
      showError = true
      isLoading = false
    }

    func showSizeShoes() {
        switch selectedGender {
        case "Hombre":
            shoesSizeNumbers =  sizeNumbers.hombre
        case "Mujer":
            shoesSizeNumbers =  sizeNumbers.mujer
        default:
            shoesSizeNumbers =  sizeNumbers.otro
        }
    }
}

fileprivate struct SizeNumbersGender {
  var hombre: [String] { ["25","25.5","26","26.5","27","27.5","28","28.5","29","29.5","30"] }
  var mujer: [String] { ["22", "22.5", "23", "23.5","24","24.5","25","25.5","26","26.5","27"] }
  var otro: [String] { ["22", "22.5", "23", "23.5","24","24.5","25","25.5","26","26.5","27","27.5","28","28.5","29","29.5","30"] }
}
