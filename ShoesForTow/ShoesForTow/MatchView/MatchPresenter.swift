//
//  MatchPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 24/09/24.
//

import SwiftUI

final class MatchPresenter: ObservableObject {

  init() { }

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
        shareImageOnFacebook()
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
        rootViewController.present(activityViewController, animated: true, completion: nil)
      }
    }
  }

}

enum SharedNetwork {
  case whatsApp
  case email
  case facebook
}
