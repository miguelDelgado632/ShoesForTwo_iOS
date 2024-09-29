//
//  RouterProtocol.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation
import SwiftUI

protocol RouterProtocol: ObservableObject {
  associatedtype Dest: Hashable
  var navPath: NavigationPath { get set }

  func navigate(to destination: Dest)

  func navigateBack()

  func navigateToRoot()

  func navigateBackTo(steps: Int)
}

extension RouterProtocol {
  func navigate(to destination: Dest) {
    navPath.append(destination)
  }

  func navigateBack() {
    navPath.removeLast()
  }

  func navigateToRoot() {
    navPath.removeLast(navPath.count)
  }

  func navigateBackTo(steps: Int) {
    navPath.removeLast(steps)
  }
}
