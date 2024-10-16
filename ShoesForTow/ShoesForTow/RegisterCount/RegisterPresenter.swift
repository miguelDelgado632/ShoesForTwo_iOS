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
            numberGender = selectedGender == "Hombre" ? 1 : selectedGender == "Mujer" ? 2 : 3
            shoesSize = nil
            showSizeShoes()
        }
    }
    @Published var selectFoot: String = "" {
        didSet {
            valueSelectFoot = selectFoot == "Izquierdo" ? 1 : 2
        }
    }
  @Published var shoesSize: String? = nil
  @Published var numberGender: Int = 0
  @Published var selectedImage: UIImage?
  @Published var checkTermisAndConditios: Bool = false
  @Published var isLoading: Bool = false
  @Published var shoesSizeNumbers: [String] = []
  @Published var showError: Bool = false

  private let service: RegistrationService = .init()
  private var cancellables: Set<AnyCancellable> = []
  private let sizeNumbers: SizeNumbersGender = .init()
    private var valueSelectFoot: Int = 0
  
  var errorText: String = ""

    var checkValuesInTextField: Bool {
        !name.isEmpty && !apellido.isEmpty && email.isValidEmail && !password.isEmpty && !selectedGender.isEmpty && checkTermisAndConditios && !selectFoot.isEmpty && shoesSize != nil
    }

  init() { }

  func register(_ completion: @escaping () -> Void) {
      isLoading = true
      let foto64 = selectedImage?.toPngString() ?? ""
      
      if checkValuesInTextField {
          let data: RegistrationRequestModel = .init(
            nombre: name,
            apellidos: apellido,
            email: email,
            password: password,
            genero: numberGender,
            talla: shoesSize ?? "24",
            pie: valueSelectFoot,
            foto: foto64)

          
          
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
                      let idUser = response.data?.first?.idUser
                      let userPhoto = response.data?.first?.photo
                      if let id = idUser, let photo = userPhoto {
//                          UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userID.rawValue)
//                          UserDefaults.standard.setIdUser(for: id)
//                          UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userPhoto.rawValue)
//                          UserDefaults.standard.setUserPhoto(for: photo)
                          completion()
                          self?.isLoading = false
                      } else {
                          self?.errorText = response.message ?? ""
                          self?.handleError()
                      }
                  } else {
                      self?.errorText = response.message ?? "Ocurrio Un error"
                      self?.handleError()
                  }
              }
              .store(in: &cancellables)
      } else {
          errorText = "Campos Invalidos"
          self.isLoading = false
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
  var hombre: [String] { ["24 cm","24.5 cm","25 cm","25.5 cm","26 cm","26.5 cm","27 cm","27.5 cm","28 cm","28.5 cm","29 cm","29.5 cm","30 cm"] }
  var mujer: [String] { ["22 cm", "22.5 cm", "23 cm", "23.5 cm","24 cm","24.5 cm","25 cm","25.5 cm","26 cm","26.5 cm","27 cm"] }
  var otro: [String] { ["22 cm", "22.5 cm", "23 cm", "23.5 cm","24 cm","24.5 cm","25 cm","25.5 cm","26 cm","26.5 cm","27 cm","27.5 cm","28 cm","28.5 cm","29 cm","29.5 cm","30 cm"] }
}
