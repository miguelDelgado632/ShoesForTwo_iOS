//
//  PurchaseSendInformationPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI

final class PurchaseSendInformationPresenter: ObservableObject {

    @Published var addressNumber: String = ""
    @Published var postalCode: String = ""
    @Published var neighborhood: String = ""
    @Published var delegation: String = ""
    @Published var city: String = ""
    @Published var reference: String = ""
    @Published var cardNumber: String = ""
    @Published var cardName: String = ""
    @Published var date: String = ""
    @Published var cvv: String = ""
    
    init () {}
    
}
