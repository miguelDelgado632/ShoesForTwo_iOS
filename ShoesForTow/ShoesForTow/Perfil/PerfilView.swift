//
//  PerfilView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI

struct PerfilView: View {

    @ObservedObject var presenter: PerfilPresenter = .init()

    var body: some View {
        GeometryReader { geometry in
        VStack {
            TabBarCustom(title: "Perfil")
            
            Image("icono_photo_perfil")
                .resizable()
                .frame(width: 211, height: 211)
                .padding(.top, 77)
            
            VStack(spacing: 10) {
                HStack(spacing: 0) {
                    Text("Nombre:")
                        .font(.monserrat(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: .trailing)
                    TextField("Name", text: $presenter.nameText)
                        .font(.monserrat(weight: .bold, .size18))
                        .frame(width: geometry.size.width / 2)
                }
                HStack(spacing: 0) {
                    Text("Talla:")
                        .font(.monserrat(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: .trailing)
                    TextField("Size", text: $presenter.size)
                        .font(.monserrat(weight: .bold, .size18))
                        .frame(width: geometry.size.width / 2)
                }
                HStack(spacing: 0) {
                    Text("¿Que zapatos buscas?:")
                        .font(.monserrat(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: .trailing)
                        .multilineTextAlignment(.trailing)
                    TextField("Name", text: $presenter.shoes)
                        .font(.monserrat(weight: .bold, .size18))
                        .frame(width: geometry.size.width / 2)
                }
                Button {
                    presenter.setInformation()
                } label: {
                    Text("Crear cuenta")
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
