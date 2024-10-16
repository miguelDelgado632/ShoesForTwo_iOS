//
//  PurchaseSendInformationView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 25/09/24.
//

import SwiftUI

struct PurchaseSendInformationView: View {
    
    @ObservedObject var presenter: PurchaseSendInformationPresenter = .init()
    @FocusState private var activeTF: ActiveKeyboardField!
    @EnvironmentObject var router: MatchRouter
    let shoeData: GuestUserInfo
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Text("Datos de envío")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.monserrat(weight: .semiBold, .size16))
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
                        .font(.monserrat(weight: .semiBold, .size16))
                        .foregroundStyle(Color.fontRed)
                        .padding(.top, 36)
                        .padding(.horizontal, 30)
                    VStack(spacing: 10) {
                        
                        TextFieldCustom(nameTextField: "Número de tarjeta", text: .init(get: {
                            presenter.cardNumber
                        }, set: { value in
                            presenter.cardNumber = ""
                            let startIndex = value.startIndex
                            for index in 0..<value.count {
                                let stringIndex = value.index(startIndex, offsetBy: index)
                                presenter.cardNumber += String(value[stringIndex])
                                
                                if (index + 1) % 5 == 0 && value[stringIndex] != " " {
                                    presenter.cardNumber.insert(" ", at: stringIndex)
                                }
                            }
                            if value.last == " " {
                                presenter.cardNumber.removeLast()
                            }
                            presenter.cardNumber = String(presenter.cardNumber.prefix (19))
                            
                        }))
                            .keyboardType(.numberPad)
                            .focused($activeTF, equals: .cardNumber)
                            .padding(.top, 42)
                        TextFieldCustom(nameTextField: "Nombre de la tarjeta", text: $presenter.cardName)
                            .focused($activeTF, equals: .cardHolderName)
                        HStack(spacing: 20) {
                            TextFieldCustom(nameTextField: "Fecha", text: $presenter.date)
                                .keyboardType(.numberPad)
                                .focused($activeTF, equals: .expirationDate)
                            TextFieldCustom(nameTextField: "CVV", text: $presenter.cvv)
                                .keyboardType(.numberPad)
                                .focused($activeTF, equals: .cvv)
                        }
                    }
                    .padding(.horizontal, 30)
                    Button {
                        router.navigate(to: .paymentConfirmation(shoeData.name))
                    } label: {
                        Text("Aceptar")
                            .font(.monserrat(weight: .light, .size16))
                            .foregroundStyle(Color.fontGray)
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
                    .padding(.top, 46)
                }
                .navigationBarBackButtonHidden()
                .padding(.bottom, 20)
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    PurchaseSendInformationView(shoeData: GuestUserInfo(idProduct: "1212332", nameProdcut: "hola", costProduct: "23323232", imgProduct: "", idUser: "fsfsdf", name: "nike", productFoot: "izquierdo", photo: ""))
}

enum ActiveKeyboardField {
    case cardNumber
    case cardHolderName
    case expirationDate
    case cvv
}
