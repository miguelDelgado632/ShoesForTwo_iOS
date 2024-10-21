//
//  CarShopView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

struct CarShopView: View {
    
    @ObservedObject var presenter: CardShopPresenter = .init()
    @EnvironmentObject var router: ProfileRouter
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    TabBarCustom(title: "Carrito", customRouter: router)
                    VStack(spacing: 20) {
                        ForEach(presenter.carData, id: \.self) { data in
                            CardToBuy(nameShoes: data.name,
                                      imageUrl: data.productImage,
                                      priceShoes: "$\(data.cost)",
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
}

#Preview {
    CarShopView()
}
