//
//  HelpView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI

struct HelpView: View {

    @ObservedObject var presenter: HelpPresenter = .init()
    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
            TabBarCustom(title: "Ayuda")
            HStack(spacing: 15) {
                Image("icono_help")
                    .resizable()
                    .frame(width: 80, height: 80)
                VStack(alignment: .leading) {
                    Text("Si requieres ayuda con alguno de los siguientes puntos, por favor comunícate al siguiente número de WhatsApp:")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("55 33 22 33 22")
                        .font(.monserrat(weight: .semiBold, .size14))
                        .foregroundStyle(Color.fontGray)
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 40)
            .padding(.top, 28)

            HStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("-Mi pedido no llegó")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("-El calzado no me quedó")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("-Mi pedido no es el correcto")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("-Quiero cambiar mi dirección  \nde envío")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("-Problemas con el pago")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                    Text("-Quiero devolver mi pedido")
                        .font(.monserrat(weight: .regular, .size14))
                        .foregroundStyle(Color.fontGray)
                }
                .padding(.top, 20)
                .padding(.trailing, 40)
            }
            Spacer()
        }
    }
}

#Preview {
    HelpView()
}
