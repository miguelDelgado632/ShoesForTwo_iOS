//
//  PerfilPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation


final class PerfilPresenter: ObservableObject {

    @Published var nameText: String
    @Published var shoesSize: String? = nil
    @Published var shoes: String
    

    init() {
        nameText = " Miguel"
        shoesSize = " 28.5 cm"
        shoes = " Izquierdo"
    }

    func setInformation() {
        print("Servicio editar, \(nameText)")
    }
}
