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
            router?.navigate(to: .perfil)
        default:
            break
        }
        print("Option Menu, \(option)")
    }
}
