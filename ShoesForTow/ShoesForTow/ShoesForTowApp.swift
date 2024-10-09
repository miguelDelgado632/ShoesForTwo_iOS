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
            case .termsConditions:
                LinkWebView(url: "https://proyectos-ddbmexico.com/Shoes/politicas.html")
            }
          }
      }
      .environmentObject(router)
      .fullScreenCover(isPresented: $router.tabView) {
        TabContainerView()
        .environmentObject(router)
      }
    }
  }
}
