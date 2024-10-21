//
//  CardToBuy.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

struct CardToBuy: View {
    
    var nameShoes: String
    var imageUrl: String
    var priceShoes: String
    var fontPrice: Font
    var colorFontPrice: Color
    var actionButton: () -> Void
    var body: some View {
        HStack(spacing: 29) {
            ShoeDetailView(image: .leftShoeTest, imageUrl: imageUrl, backgroundColor: .fontRed, componentSize: 125, backgroundOpacity: 0.15)
            VStack {
                Text(nameShoes)
                    .font(.monserrat(weight: .regular, .size14))
                    .foregroundStyle(colorFontPrice)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                Text(priceShoes)
                    .font(fontPrice)
                    .foregroundStyle(colorFontPrice)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                PrimaryButton(action: actionButton,
                            title: "Completar compra",
                            width: 123,
                            height: 28,
                            font: .monserrat(weight: .regular, .size12))
                .frame(maxWidth: .infinity ,alignment: .leading)
            }
        }
    }
}

#Preview {
    CardToBuy(nameShoes: "converse", imageUrl: "",priceShoes: "$600", fontPrice: Font.monserrat(weight: .black, .size14), colorFontPrice: .fontGray, actionButton: { })
}
