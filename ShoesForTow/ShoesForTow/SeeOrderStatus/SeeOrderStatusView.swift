//
//  SeeOrderStatusView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 27/09/24.
//

import SwiftUI

struct SeeOrderStatusView: View {
    
    @ObservedObject var presenter: SeeOrderStatusPresenter = .init()
    @EnvironmentObject var router: MatchRouter
    
    let shoeName: String
    var arriveTo: ArriveTo
    
    var body: some View {
        VStack {
            switch arriveTo {
            case .MyOrders:
                TabBarCustom(title: "Segumiento de pago")
            case .PaymentConfirmation:
                Text("Segumiento de pago")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size16))
                    .foregroundStyle(Color.fontRed)
                    .padding(.horizontal, 30)
            }
            
            ShoeDetailView(image: .leftShoeTest,
                           name: shoeName,
                           side: "izquierdo",
                           price: "$600",
                           backgroundOpacity: 0.13,
                           titleFont: .monserrat(weight: .regular, .size12),
                           subtitleFont: .monserrat(weight: .regular, .size16))
            .padding(.top, 38)
            Text(presenter.orderNumber)
                .font(.monserrat(weight: .regular, .size12))
                .padding(.top, 25)
            Image("paymentConfirmationStatus")
                .resizable()
                .frame(maxWidth: .infinity)
                .frame(height: 19)
                .padding(.horizontal, 30)
                .padding(.top, 60)
            if arriveTo == .PaymentConfirmation {
                Button {
                    router.navigateBackTo(steps: 5)
                } label: {
                    Text("Otro Match")
                        .font(.monserrat(weight: .light, .size16))
                        .foregroundStyle(Color.fontGray)
                }
                .frame(width: 176, height: 35)
                .background(Color.backgroundColor)
                .padding(.top, 35)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .padding(.bottom, 20)
        .padding(.top, 10)
    }
}

#Preview {
    SeeOrderStatusView(shoeName: "Converse 1", arriveTo: .MyOrders)
}

public enum ArriveTo: Encodable {
    case MyOrders
    case PaymentConfirmation
}
