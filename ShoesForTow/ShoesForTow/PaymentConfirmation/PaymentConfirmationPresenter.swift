//
//  PaymentConfirmationPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI

final class PaymentConfirmationPresenter: ObservableObject {

    @Published var orderNumber: String = "Número de pedido: 2065"
    @Published var dateArrive: String = "Fecha de entrega: 20/10/2024"
    
    init () {
        
    }
}
