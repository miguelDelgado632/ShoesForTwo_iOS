//
//  PerfilMenuView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI

struct PerfilMenuView: View {
    @EnvironmentObject var router: Router
    @ObservedObject var presenter: PerfilMenuPresenter = .init()
    
    var body: some View {
        ImageTextMenu(action: presenter.showOptions(option:))
            .onAppear{
                self.presenter.setup(self.router)
            }
    }
}

#Preview {
    PerfilMenuView()
}

struct ImageTextMenu: View {

    var action: (PerfilMenuData) -> Void
    
    var imagesName = ["perfil_icono",
                      "car_icono",
                      "order_icono",
                      "notifications_icono",
                      "help_icono"]
    
    
    var body: some View {
        
        VStack(spacing: 35) {
            ForEach(PerfilMenuData.allCases.indices, id: \.self) { index in
                Button {
                    action(PerfilMenuData.allCases[index])
                } label: {
                    HStack(spacing: 33) {
                        Image(imagesName[index])
                            .resizable()
                            .frame(width: 60, height: 60)
                        Text(PerfilMenuData.allCases[index].rawValue)
                            .font(.monserrat(weight: .regular, .size14))
                            .foregroundStyle(Color.fontGray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 40)
                }
            }
            Spacer()
        }
        .padding(.top, 40)
    }
}

enum PerfilMenuData: String, CaseIterable {
    case perfil = "Perfil"
    case carrito = "Carrito"
    case pedidos = "Mis pedidos"
    case invitaciones = "Invitaciones"
    case help = "Ayuda"
}
