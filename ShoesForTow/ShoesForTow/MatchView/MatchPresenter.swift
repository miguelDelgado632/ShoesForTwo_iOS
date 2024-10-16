//
//  MatchPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 24/09/24.
//

import SwiftUI
import Combine

final class MatchPresenter: ObservableObject {

    @Published var isLoading: Bool = false
    @Published var showError: Bool = false
    @Published var userOne: UserMatchDataModel?
    @Published var userTwo: UserMatchDataModel?
    @Published var userOneGuest: GuestUserInfo?
    @Published var userTwoGuest: GuestUserInfo?
    
    private let service: MatchService = .init()
    var productId: String
    var errorText: String = ""
    private var cancellables: Set<AnyCancellable> = .init()
    

  init(productId: String) {
      self.productId = productId
      getData()
  }

    func sendInvitation(_ completion: @escaping () -> Void) {
        let request = SendInvitationRequestModel(id_user_one: userOne?.userId ?? "",
                                                 id_producto_one: userOne?.idProducto ?? "",
                                                 id_user_two: userTwo?.userId ?? "",
                                                 id_producto_two: userTwo?.idProducto ?? "")
      service.sendInvitation(for: request)
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
        } receiveValue: { [weak self] guestUsers in
          guard let self = self else { return }
           print("Usuarios Invitados data \(guestUsers)")
            completion()
            userOneGuest = guestUsers.data?.invite.compactMap( { $0.userOne }).first
            userTwoGuest = guestUsers.data?.invite.compactMap( { $0.userTwo }).first
        }
        .store(in: &cancellables)
    }

    private func getData() {
      isLoading = true
      service.getData(idProduct: productId)
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
          self.isLoading = false
        } receiveValue: { [weak self] users in
          guard let self = self else { return }
            print("USERS MATCH \(users)")
            userOne = users.data?.matches.compactMap({ $0.userOne }).first
            userTwo = users.data?.matches.compactMap({ $0.userTwo }).first
           self.isLoading = false
        }
        .store(in: &cancellables)
    }

      private func handleError() {
        showError = true
        isLoading = false
      }

  func goToSharedInWhatsApp(network: SharedNetwork) {
    let message = "First Whatsapp Share & https://www.google.co.in"
    let topic = "App shoes for two"
    var queryCharSet = NSCharacterSet.urlQueryAllowed
    queryCharSet.remove(charactersIn: "+&")
    var networkStringUrl: String = ""

    if let escapedString = message.addingPercentEncoding(withAllowedCharacters: queryCharSet) {
      switch network {
      case .whatsApp:
        networkStringUrl = "whatsapp://send?text=\(escapedString)"
      case .email:
        networkStringUrl = "mailto:\("")?subject=\(topic)&body=\(escapedString)"
      case .facebook:
//        shareImageOnFacebook()
//        openFacebookApp()
        shareOnFacebook()
        return
      }
      if let whatsappURL = URL(string: networkStringUrl) {
        if UIApplication.shared.canOpenURL(whatsappURL) {
          UIApplication.shared.open(whatsappURL, options: [: ], completionHandler: nil)
        } else {
          debugPrint("please install \(network)")
        }
      }
    }
  }

  // Function to share image using UIActivityViewController
  func shareImageOnFacebook() {
    guard let image = UIImage(systemName: "person") else { return }

    let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)

    // Exclude unnecessary activity types if needed
    activityViewController.excludedActivityTypes = [.postToTwitter, .postToWeibo, .postToFlickr]

    // Get the top most view controller to present the UIActivityViewController
    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
      if let rootViewController = windowScene.windows.first?.rootViewController {
        rootViewController.modalPresentationStyle = .overCurrentContext
        rootViewController.present(activityViewController, animated: true, completion: nil)
      }
    }
  }


  func openFacebookApp() {
    let facebookURL = URL(string: "fb://profile")!

    if UIApplication.shared.canOpenURL(facebookURL) {
      UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
    } else {
      // Open in browser if Facebook app is not installed
      UIApplication.shared.open(URL(string: "https://facebook.com")!, options: [:], completionHandler: nil)
    }
  }

  func shareOnFacebook() {
    let imageUrl = "https://www.alambassociates.com/wp-content/uploads/2016/10/maxresdefault.jpg"
    let facebookUrlScheme = "https://www.facebook.com/sharer/sharer.php?u=\(imageUrl)"

    if let url = URL(string: facebookUrlScheme) {
      UIApplication.shared.open(url)
    }
  }

  func shareOnFacebook1() {
    // The image or URL you want to share
    let imageUrl = "https://www.alambassociates.com/wp-content/uploads/2016/10/maxresdefault.jpg"

    // URL for sharing on Facebook via browser (default fallback)
    let facebookUrlScheme = "https://www.facebook.com/sharer/sharer.php?u=\(imageUrl)"

    // Custom URL scheme to open Facebook app
    if let facebookAppURL = URL(string: "fb://profile") {
      if UIApplication.shared.canOpenURL(facebookAppURL) {
        // If Facebook app is installed, open it
        UIApplication.shared.open(URL(string: facebookUrlScheme)!)
      } else {
        // Fallback to browser if the app isn't installed
        if let url = URL(string: facebookUrlScheme) {
          UIApplication.shared.open(url)
        }
      }
    }
  }
}

enum SharedNetwork {
  case whatsApp
  case email
  case facebook
}
