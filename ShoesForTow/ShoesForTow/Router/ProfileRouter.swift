//
//  ProfileRouter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 29/09/24.
//

import Foundation
import SwiftUI

public enum ProfileDestination: Encodable, Hashable {
  case profileView
  case carShop
  case myOrder
  case invitationsView
  case helpView
  case seeOrderStatus(String, ArriveTo)
}

final class ProfileRouter: RouterProtocol {
  typealias Dest = ProfileDestination

  @Published var navPath = NavigationPath()
}
