//
//  PerfilPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import Foundation


final class PerfilPresenter: ObservableObject {

    @Published var nameText: String

    init() {
        nameText = " Miguel"
    }
}
