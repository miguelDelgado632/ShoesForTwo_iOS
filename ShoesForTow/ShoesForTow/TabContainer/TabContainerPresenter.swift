//
//  TabContainerPresenter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation
import Combine

final class TabContainerPresenter: ObservableObject {
  @Published private var selection = 2
  @Published var tabSelection: Int = 2
  @Published var navigation: ShoesForTwoNavigation
  @Published var shouldDismiss: Bool = false

  init(navigation: ShoesForTwoNavigation) {
    self.navigation = navigation
  }
}
