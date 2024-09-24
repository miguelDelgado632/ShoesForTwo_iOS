//
//  PerfilPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation


final class PerfilPresenter: ObservableObject {

    @Published var nameText: String
    @Published var size: String
    @Published var shoes: String

    init() {
        nameText = " Miguel"
        size = " 28.5 cm"
        shoes = " Izquierdo"
    }

    func setInformation() {
        print("Servicio editar, \(nameText)")
    }
}
