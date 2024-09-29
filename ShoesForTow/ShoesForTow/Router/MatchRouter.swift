//
//  MatchRouter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation
import SwiftUI

public enum MatchDestination: Encodable, Hashable {
  case matchView
  case purchaseSendInformationView(String)
  case completePurchase(String)
}

final class MatchRouter: RouterProtocol {
  typealias Dest = MatchDestination

  @Published var navPath = NavigationPath()
}
