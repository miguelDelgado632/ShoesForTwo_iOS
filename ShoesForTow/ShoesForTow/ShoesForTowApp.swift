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
          .navigationDestination(for: Destination.self) { destination in
            switch destination {
            case .registerView:
              RegisterView()
            case .tabHomeView:
              TabContainerView()
            case .perfilView:
              PerfilView()
//            case .completePurchase(let shoeName):
//              CompletePurchaseView(shoeName: shoeName)
//            case .purchaseSendInformationView(let shoeName):
//                PurchaseSendInformationView(shoeName: shoeName)
            case .paymentConfirmation(let shoeName):
                PaymentConfirmationView(shoeName: shoeName)
            case .seeOrderStatus(let shoeName, let arriveTo):
                SeeOrderStatusView(shoeName: shoeName, arriveTo: arriveTo)
            case .carShop:
                CarShopView()
            case .myOrder:
                MyOrderView()
            case .invitationsView:
                InvitationsView()
            case .helpView:
                HelpView()
            }
          }
      }
      .environmentObject(router)
      .fullScreenCover(isPresented: $router.tabView) {
        TabContainerView()
      }
    }
  }
}
