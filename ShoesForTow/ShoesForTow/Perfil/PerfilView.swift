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
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            if presenter.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .navigationBarBackButtonHidden()
                    .scaleEffect(1.5)
                    .padding()
            } else {
                GeometryReader { geometry in
                    VStack {
                        TabBarCustom(title: "Perfil", customRouter: router)
                        ImageDownloaderView(imageUrl: presenter.profileData?.photo ?? "")
                            .frame(width: 211, height: 211)
                            .clipShape(Circle())
                            .padding(.top, 77)
                        
                        VStack(spacing: 10) {
                            HStack(spacing: 0) {
                                Text("Nombre: ")
                                    .font(.monserrat(weight: .regular, .size18))
                                    .foregroundStyle(Color.fontGray)
                                    .frame(width: geometry.size.width / 2, alignment: tapEditarButton ? .center : .trailing)
                                if tapEditarButton {
                                    TextField("Name", text: $presenter.nameText)
                                        .font(.monserrat(weight: .bold, .size18))
                                        .foregroundStyle(Color.fontGray)
                                        .frame(width: geometry.size.width / 2, alignment: .leading)
                                } else {
                                    Text(presenter.nameText)
                                        .font(.monserrat(weight: .bold, .size18))
                                        .foregroundStyle(Color.fontGray)
                                        .frame(width: geometry.size.width / 2, alignment: .leading)
                                }
                                
                            }
                            HStack(spacing: 0) {
                                Text("Talla: ")
                                    .font(.monserrat(weight: .regular, .size18))
                                    .foregroundStyle(Color.fontGray)
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
                                        .foregroundStyle(Color.fontGray)
                                        .frame(width: geometry.size.width / 2, alignment: .leading)
                                }
                            }
                            HStack(spacing: 0) {
                                Text("¿Qué zapatos buscas?: ")
                                    .font(.monserrat(weight: .regular, .size18))
                                    .foregroundStyle(Color.fontGray)
                                    .frame(width: geometry.size.width / 2, alignment: tapEditarButton ? .center : .trailing)
                                    .multilineTextAlignment(.trailing)
                                if tapEditarButton {
                                    ShowGenderRegister(genders: .constant(["Izquierdo", "Derecho"]),
                                                       selectedGender: $presenter.shoes,
                                                       fontSize: .size12)
                                    .frame(width: geometry.size.width / 2)
                                } else {
                                    Text(" \(presenter.shoes)")
                                        .font(.monserrat(weight: .bold, .size18))
                                        .foregroundStyle(Color.fontGray)
                                        .frame(width: geometry.size.width / 2, alignment: .leading)
                                }
                            }
                            Button {
                                tapEditarButton.toggle()
                                presenter.getEditData()
                            } label: {
                                Text(tapEditarButton ? "Save" : "Editar")
                                    .font(.monserrat(weight: .light, .size16))
                                    .foregroundStyle(Color.fontGray)
                            }
                            .frame(width: 176, height: 35)
                            .background(Color.backgroundColor)
                            .padding(.top, 75)
                        }
                        .padding(.top, 20)
                        Spacer()
                    }
                    .navigationBarBackButtonHidden()
                    .alert("Alerta", isPresented: $presenter.showError) {
                        Button("OK") {}
                    } message: {
                        Text(presenter.errorText)
                    }
                }
            }
        }
    }
}

#Preview {
    PerfilView()
}
