//
//  SeeOrderStatusPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

final class SeeOrderStatusPresenter: ObservableObject {
    
    @Published var orderNumber: String = "Número de pedido: 2065"
    init() {}
}
