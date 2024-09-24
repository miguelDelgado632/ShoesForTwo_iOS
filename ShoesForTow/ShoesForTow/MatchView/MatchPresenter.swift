//
//  MatchPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 24/09/24.
//

import SwiftUI

final class MatchPresenter: ObservableObject {
    
    var router: Router?
    
    init() {
    }
    
    func setup(_ router: Router) {
        self.router = router
    }

    func tapActionPopup() {
        print("Se hizo tap en el popup")
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
    
}

enum SharedNetwork {
    case whatsApp
    case email
}
