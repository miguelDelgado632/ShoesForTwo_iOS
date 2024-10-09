//
//  PerfilMenuView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI

struct PerfilMenuView: View {
  @EnvironmentObject var router: ProfileRouter
  @ObservedObject var presenter: PerfilMenuPresenter = .init()

  var body: some View {
    NavigationStack(path: $router.navPath) {
      ImageTextMenu(action: router.navigate(to:))
        .navigationDestination(for: ProfileDestination.self) { destination in
          switch destination {
          case .profileView:
            PerfilView()
          case .carShop:
            CarShopView()
          case .myOrder:
            MyOrderView()
          case .invitationsView:
            InvitationsView()
          case .helpView:
            HelpView()
          case .seeOrderStatus(let shoeName, let arriveTo):
            SeeOrderStatusView(shoeName: shoeName, arriveTo: arriveTo)
          }
        }
    }
  }
}

#Preview {
  PerfilMenuView()
}

struct ImageTextMenu: View {

    var action: (ProfileDestination) -> Void

    var imagesName = ["perfil_icono",
                      "car_icono",
                      "order_icono",
                      "notifications_icono",
                      "help_icono"]
    
    
    var body: some View {
        
        VStack(spacing: 35) {
            ForEach(PerfilMenuData.allCases.indices, id: \.self) { index in
                Button {
                  action(PerfilMenuData.allCases[index].destination)
                } label: {
                    HStack(spacing: 30) {
                        Image(imagesName[index])
                            .resizable()
                            .frame(width: 50, height: 50)
                        Text(PerfilMenuData.allCases[index].rawValue)
                            .font(.monserrat(weight: .regular, .size16))
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

  var destination: ProfileDestination {
    switch self {
    case .perfil: return .profileView
    case .carrito: return .carShop
    case .pedidos: return .myOrder
    case .invitaciones: return .invitationsView
    case .help: return .helpView
    }
  }
}
