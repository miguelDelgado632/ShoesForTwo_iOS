//
//  CarShopView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

struct CarShopView: View {
    
    @ObservedObject var presenter: CardShopPresenter = .init()
    @EnvironmentObject var router: Router
    
    var body: some View {
        ScrollView {
            VStack {
                TabBarCustom(title: "Carrito")
                VStack(spacing: 20) {
                    ForEach(presenter.dataString, id: \.self) { name in
                        CardToBuy(nameShoes: name,
                                  priceShoes: "$600",
                                  fontPrice: .monserrat(weight: .regular, .size16),
                                  colorFontPrice: .fontGray,
                                  actionButton: presenter.gotoContinueBuy)
                    }
                }
                .padding([.horizontal, .top], 40)
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    CarShopView()
}
