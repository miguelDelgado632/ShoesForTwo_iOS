//
//  PaymentConfirmationView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI

struct PaymentConfirmationView: View {
    
    @ObservedObject var presenter: PaymentConfirmationPresenter = .init()
    @EnvironmentObject var router: MatchRouter
    let shoeName: String
    
    var body: some View {
        ScrollView {
            VStack {
                Text("Confirmación de pago")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size16))
                    .foregroundStyle(Color.fontRed)
                    .padding(.horizontal, 30)
                VStack(spacing: 10) {
                    Text("Pago exitoso")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.monserrat(weight: .regular, .size16))
                        .foregroundStyle(Color.fontGray)
                    Text(presenter.orderNumber)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.monserrat(weight: .regular, .size16))
                        .foregroundStyle(Color.fontGray)
                    Text(presenter.dateArrive)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.monserrat(weight: .regular, .size16))
                        .foregroundStyle(Color.fontGray)
                }
                .padding(.top, 40)
                .padding(.horizontal, 30)
                ShoeDetailView(image: .leftShoeTest,
                               name: shoeName,
                               side: "izquierdo",
                               price: "$600",
                               backgroundOpacity: 0.13,
                               titleFont: .monserrat(weight: .regular, .size12),
                               subtitleFont: .monserrat(weight: .regular, .size16))
                .padding(.top, 20)
                
                VStack {
                    Text("¡Estamos preparando tu pedido!")
                        .frame(width: 180, alignment: .center)
                        .multilineTextAlignment(.center)
                        .font(.monserrat(weight: .regular, .size16))
                        .foregroundStyle(Color.fontRed)
                        .padding(.horizontal, 30)
                    Button {
                        router.navigate(to: .seeOrderStatus(shoeName, .PaymentConfirmation))
                    } label: {
                        Text("Ver status del pedido")
                            .font(.monserrat(weight: .light, .size16))
                            .foregroundStyle(Color.fontPurple)
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
                    .padding(.top, 35)
                }
                .padding(.top, 40)
                Spacer()
                
            }
            .navigationBarBackButtonHidden()
            .padding(.bottom, 20)
            .padding(.top, 10)
        }
    }
}

#Preview {
    PaymentConfirmationView(shoeName: "Nike")
}
