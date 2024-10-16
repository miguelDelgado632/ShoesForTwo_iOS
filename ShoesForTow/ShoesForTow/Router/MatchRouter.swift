//
//  MatchRouter.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation
import SwiftUI

public enum MatchDestination: Encodable, Hashable {
  case matchView(String)
  case otherUserProfile(String)
  case purchaseSendInformationView(GuestUserInfo)
  case completePurchase(GuestUserInfo)
  case paymentConfirmation(String)
  case seeOrderStatus(String, ArriveTo)
}

final class MatchRouter: RouterProtocol {
  typealias Dest = MatchDestination

  @Published var navPath = NavigationPath()
}
