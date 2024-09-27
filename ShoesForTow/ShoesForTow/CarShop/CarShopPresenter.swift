//
//  CarShopPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

final class CardShopPresenter: ObservableObject {
    var dataString = ["Converse", "Nike", "otro tennis", "otro ms"]
    init() { }

    func gotoContinueBuy() {
        print("Continuar compra")
    }
}
