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
            Text("Perfil")
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.poppins(weight: .extraBold, .size14))
                .foregroundStyle(Color.fontRed)
                .padding(.top, 50)
                .padding(.horizontal, 35)
            
            Image("icono_photo_perfil")
                .resizable()
                .frame(width: 211, height: 211)
                .padding(.top, 77)
            
            VStack {
                HStack(spacing: 0) {
                    Text("Nombre:")
                        .font(.poppins(weight: .regular, .size18))
                        .frame(width: geometry.size.width / 2, alignment: .trailing)
                    TextField("Name", text: $presenter.nameText)
                        .font(.poppins(weight: .bold, .size18))
                        .frame(width: geometry.size.width / 2)
                }
                .padding(.top, 20)
            }
            Spacer()
        }
    }
    }
}

#Preview {
    PerfilView()
}
