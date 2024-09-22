//
//  Router.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import Foundation
import SwiftUI

final class Router: ObservableObject {

  public enum Destination: Codable, Hashable {
    case registerView
    case tabHomeView
    case perfil
  }

  @Published var navPath = NavigationPath()

  func navigate(to destination: Destination) {
    navPath.append(destination)
  }

  func navigateBack() {
    navPath.removeLast()
  }

  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }
}
