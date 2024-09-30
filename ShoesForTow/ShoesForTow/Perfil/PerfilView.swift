//
//  PerfilView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI

struct PerfilView: View {

  @EnvironmentObject var router: ProfileRouter
    @ObservedObject var presenter: PerfilPresenter = .init()
    @State private var tapEditarButton: Bool = false

    var body: some View {
        GeometryReader { geometry in
        VStack {
          TabBarCustom(title: "Perfil", customRouter: router)
            Image("icono_photo_perfil")
                .resizable()
                .frame(width: 211, height: 211)
                .padding(.top, 77)
            
            VStack(spacing: 10) {
                HStack(spacing: 0) {
                    Text("Nombre:")
                        .font(.monserrat(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: tapEditarButton ? .center : .trailing)
                    if tapEditarButton {
                        TextField("Name", text: $presenter.nameText)
                            .font(.monserrat(weight: .bold, .size18))
                            .frame(width: geometry.size.width / 2, alignment: .leading)
                    } else {
                       Text(presenter.nameText)
                        .font(.monserrat(weight: .bold, .size18))
                        .frame(width: geometry.size.width / 2, alignment: .leading)
                    }
                    
                }
                HStack(spacing: 0) {
                   Text("Talla:")
                    .font(.monserrat(weight: .regular, .size18))
                    .frame(width: geometry.size.width / 2, alignment: tapEditarButton ? .center : .trailing)
                    if tapEditarButton {
                        DropDownPicker(
                            selection: $presenter.shoesSize,
                            options: [
                                "28",
                                "28.5",
                                "29",
                                "29.5",
                                "30"
                            ], maxWidth: geometry.size.width / 2
                        )
                    } else {
                        Text(presenter.shoesSize ?? "")
                         .font(.monserrat(weight: .bold, .size18))
                         .frame(width: geometry.size.width / 2, alignment: .leading)
                    }
                }
                HStack(spacing: 0) {
                    Text("¿Que zapatos buscas?: ")
                        .font(.monserrat(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: tapEditarButton ? .center : .trailing)
                        .multilineTextAlignment(.trailing)
                    if tapEditarButton {
                        ShowGenderRegister(genders: .constant(["Izquierdo", "Derecho"]),
                                           selectedGender: $presenter.shoes,
                                           fontSize: .size12)
                        .frame(width: geometry.size.width / 2)
                    } else {
                        Text(presenter.shoes)
                            .font(.monserrat(weight: .bold, .size18))
                            .frame(width: geometry.size.width / 2, alignment: .leading)
                    }
                }
                Button {
                    tapEditarButton.toggle()
                    presenter.setInformation()
                } label: {
                    Text(tapEditarButton ? "Save" : "Editar")
                        .font(.monserrat(weight: .light, .size16))
                        .foregroundStyle(Color.fontPurple)
                }
                .frame(width: 176, height: 35)
                .background(Color.backgroundColor)
                .padding(.top, 75)
            }
            .padding(.top, 20)
            Spacer()
        }
        .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    PerfilView()
}
