//
//  ShoesForTowApp.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 17/09/24.
//

import SwiftUI

@main
struct ShoesForTowApp: App {
  @ObservedObject var router = Router()

  var body: some Scene {
    WindowGroup {
      NavigationStack(path: $router.navPath) {
        LoginView()
          .navigationDestination(for: Router.Destination.self) { destination in
            switch destination {
            case .registerView:
              RegisterView()
            case .tabHomeView:
              TabContainerView()
            case .perfilView:
              PerfilView()
            case .matchView:
                MatchView()
            case .completePurchase(let shoeName):
              CompletePurchaseView(shoeName: shoeName)
            case .purchaseSendInformationView(let shoeName):
                PurchaseSendInformationView(shoeName: shoeName)
            case .paymentConfirmation(let shoeName):
                PaymentConfirmationView(shoeName: shoeName)
            case .seeOrderStatus(let shoeName):
                SeeOrderStatusView(shoeName: shoeName)
            case .carShop:
                CarShopView()
            }
          }
      }
      .environmentObject(router)
    }
  }
}
