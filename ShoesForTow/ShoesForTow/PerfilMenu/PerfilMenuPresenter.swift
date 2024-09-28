//
//  PerfilMenuPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation
import SwiftUI

final class PerfilMenuPresenter: ObservableObject {

    var router: Router?
    
    init() {
    }

    func setup(_ router: Router) {
        self.router = router
      }

    func showOptions(option: PerfilMenuData) {
        switch option {
        case .perfil:
            router?.navigate(to: .perfilView)
        case .carrito:
            router?.navigate(to: .carShop)
        case .pedidos:
            router?.navigate(to: .myOrder)
        case .invitaciones:
            router?.navigate(to: .invitationsView)
        case .help:
            router?.navigate(to: .helpView)
        }
        print("Option Menu, \(option)")
    }
}
