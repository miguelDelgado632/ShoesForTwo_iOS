//
//  TabContainerView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import SwiftUI

struct TabContainerView: View {
  @Environment(\.presentationMode) var presentationMode
  @ObservedObject var presenter: TabContainerPresenter = .init(navigation: .init())
  private let texts: TabContainerTexts = .init()

  var body: some View {
    TabView(selection: $presenter.tabSelection) {
      HomeFavoritesView()
        .tabItem {
          makeTabItem(icon: "icono_favoritos", title: texts.favoritesTitle)
        }
        .tag(1)

      Text("Tab Content 2")
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
    .accentColor(.fontPurple)
  }

  private func makeTabItem(icon: String, title: String) -> some View {
    VStack(spacing: .zero) {
      Image(icon)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 20, height: 20)
      Text(title)
        .foregroundColor(.fontPurple)
        .font(.poppins(weight: .medium, .size10))
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

import Combine
final class TabContainerPresenter: ObservableObject {
  @Published private var selection = 1
  @Published var tabSelection: Int = 1
  @Published var navigation: ShoesForTwoNavigation
  @Published var shouldDismiss: Bool = false

  init(navigation: ShoesForTwoNavigation) {
    self.navigation = navigation
  }
}

final class ShoesForTwoNavigation: ObservableObject {
  @Published var isFavoriteViewActive: Bool = false
  @Published var isPrivacyPoliticsAcive: Bool = false
  @Published var isSavedViewActive: Bool = false
  @Published var shouldShowTabHomeView: Bool = false

  func updateActiveView(_ tag: Int) {
    switch tag {
    case 1:
      isFavoriteViewActive = false
    case 2:
      isPrivacyPoliticsAcive = false
    case 3:
      isSavedViewActive = false
    default: break
    }
  }

  func resetValues() {
    isFavoriteViewActive = false
    isPrivacyPoliticsAcive = false
    isSavedViewActive = false
    shouldShowTabHomeView = false
  }
}
