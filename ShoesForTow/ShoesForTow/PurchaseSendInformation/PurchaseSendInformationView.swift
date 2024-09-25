//
//  PurchaseSendInformationView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI

struct PurchaseSendInformationView: View {
    
    @ObservedObject var presenter: PurchaseSendInformationPresenter = .init()
    @EnvironmentObject var router: Router
    let shoeName: String
    
    var body: some View {
        ScrollView {
            VStack {
                TabBarCustom(title: "")
                    .padding(.bottom, 40)
                Text("Datos de envío")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size16))
                    .foregroundStyle(Color.fontRed)
                    .padding(.horizontal, 30)
                VStack(spacing: 11) {
                    TextFieldCustom(nameTextField: "Calle y número", text: $presenter.addressNumber)
                        .padding(.top, 45)
                    TextFieldCustom(nameTextField: "C.P", text: $presenter.postalCode)
                    TextFieldCustom(nameTextField: "Colonia", text: $presenter.neighborhood)
                    TextFieldCustom(nameTextField: "Delegación", text: $presenter.delegation)
                    TextFieldCustom(nameTextField: "Ciudad o Estado", text: $presenter.city)
                    TextFieldCustom(nameTextField: "Referencias", text: $presenter.reference)
                }
                .padding(.horizontal, 30)
                Text("Datos de pago")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size16))
                    .foregroundStyle(Color.fontRed)
                    .padding(.top, 36)
                    .padding(.horizontal, 30)
                VStack(spacing: 10) {
                    TextFieldCustom(nameTextField: "Número de tarjeta", text: $presenter.cardNumber)
                        .padding(.top, 42)
                    TextFieldCustom(nameTextField: "Nombre de la tarjeta", text: $presenter.cardName)
                    HStack(spacing: 20) {
                        TextFieldCustom(nameTextField: "Fecha", text: $presenter.date)
                        TextFieldCustom(nameTextField: "CVV", text: $presenter.cvv)
                    }
                }
                .padding(.horizontal, 30)
                Button {
                    router.navigate(to: .paymentConfirmation(shoeName))
                } label: {
                    Text("Aceptar")
                        .font(.monserrat(weight: .light, .size16))
                        .foregroundStyle(Color.fontPurple)
                }
                .frame(width: 176, height: 35)
                .background(Color.backgroundColor)
                .padding(.top, 46)
            }
            .navigationBarBackButtonHidden()
            .padding(.bottom, 20)
        }
    }
}

#Preview {
    PurchaseSendInformationView(shoeName: "Converse 1")
}
