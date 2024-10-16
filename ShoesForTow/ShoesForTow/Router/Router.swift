//
//  Router.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import Foundation
import SwiftUI

public enum Destination: Encodable, Hashable {
  case registerView
  case tabHomeView
 // case termsConditions
}

final class Router: RouterProtocol {
  typealias Dest = Destination

  @Published var navPath = NavigationPath()
  @Published var tabView: Bool = false
}
