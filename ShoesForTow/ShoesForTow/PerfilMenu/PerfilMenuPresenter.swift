//
//  PerfilMenuPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation
import SwiftUI

final class PerfilMenuPresenter: ObservableObject {

    @EnvironmentObject var router: Router
    
    init() {
        
    }

    func showOptions(option: PerfilMenuData) {
        router.navigate(to: .registerView)
        print("Option Menu, \(option)")
    }
}
