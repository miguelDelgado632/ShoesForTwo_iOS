//
//  TabContainerView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import SwiftUI

struct TabContainerView: View {

  @State var matchRouter: MatchRouter = .init()
  @State var profileRouter: ProfileRouter = .init()
  @ObservedObject var presenter: TabContainerPresenter = .init(navigation: .init())
  private let texts: TabContainerTexts = .init()

    init() {
        UITabBar.appearance().backgroundColor = UIColor(hexString: "#f1eefa")
    }

  var body: some View {
      TabView(selection: $presenter.tabSelection) {
        FavoritesView()
          .tabItem {
              // presenter.tabSelection == 1 ? "icono_favoritos" : "icono_match" esto es ahora que tengamos los dos iconos
              makeTabItem(icon: "icono_favoritos", title: texts.favoritesTitle)
          }
          .tag(1)

        HomeMatchView()
          .background(Color.red)
          .tabItem {
            makeTabItem(icon: "icono_match", title: texts.matchTitle)
          }
          .tag(2)

        PerfilMenuView()
          .tabItem {
            makeTabItem(icon: "icono_perfil", title: texts.profile)
          }
          .tag(3)
      }
      .navigationBarBackButtonHidden()
      .background(Color.red)
      .padding(.top, 10)
      .accentColor(.fontPurple)
      .environmentObject(matchRouter)
      .environmentObject(profileRouter)
  }

  private func makeTabItem(icon: String, title: String) -> some View {
    VStack(spacing: .zero) {
      Image(icon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
      Text(title)
        .foregroundColor(.fontPurple)
        .font(.monserrat(weight: .medium, .size10))
    }
  }
}

#Preview {
  TabContainerView()
}

fileprivate struct TabContainerTexts {
  var favoritesTitle: String { "Favoritos" }
  var matchTitle: String { "Match" }
  var profile: String { "Perfil" }
}
