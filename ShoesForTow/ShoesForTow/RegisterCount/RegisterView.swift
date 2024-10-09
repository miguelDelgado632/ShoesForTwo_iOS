//
//  RegisterView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI
import PhotosUI

struct RegisterView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var presenter: RegisterPresenter = .init()
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    TabBarCustom(title: "")
                    Text("Crear cuenta")
                        .font(.monserrat(weight: .semiBold, .size16))
                        .foregroundStyle(Color.fontRed)
                        .padding(.top, 20)
                    TextFieldCustom(nameTextField: "Nombres", text: $presenter.name)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                    TextFieldCustom(nameTextField: "Apellidos", text: $presenter.apellido)
                        .padding(.top, 6)
                        .padding(.horizontal, 30)
                    TextFieldCustom(nameTextField: "Correo", text: $presenter.email)
                        .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
                        .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
                        .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
                        .padding(.top, 6)
                        .padding(.horizontal, 30)
                    SecureField("Contraseña", text: $presenter.password)
                        .padding(.leading, 10)
                        .frame(height: 35)
                        .font(.monserrat(weight: .light, .size16))
                        .background(Color.backColor)
                        .foregroundStyle(Color.fontGray)
                        .border(Color.fontGray, width: 0.7)
                        .textContentType(.password)
                        .padding(.horizontal, 30)
                        .padding(.top, 6)
                    Text("Género")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.monserrat(weight: .extraBold, .size14))
                        .foregroundStyle(Color.fontGray)
                        .padding(.top, 34)
                        .padding(.horizontal, 30)
                    ShowGenderRegister(genders: .constant(["Hombre", "Mujer", "Otro"]),
                                       selectedGender: $presenter.selectedGender)
                    .padding(.horizontal, 30)
                    DropDownPicker(
                        selection: $presenter.shoesSize,
                        options: presenter.shoesSizeNumbers
                    )
                    .padding(.top, 29)
                    .padding(.horizontal, 30)
                    Text("¿Qué zapato buscas?")
                        .frame(height: 35, alignment: .leading)
                        .font(.monserrat(weight: .extraBold, .size14))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(Color.fontGray)
                        .padding(.horizontal, 30)
                        .padding(.top, 34)
                    ShowGenderRegister(genders: .constant(["Izquierdo", "Derecho"]),
                                       selectedGender: $presenter.selectFoot)
                    .padding(.horizontal, 30)
                    
                    SetPerfilImageView(selectedImage: $presenter.selectedImage)
                        .padding(.horizontal, 30)
                    
                    CheckTermsAndConditions(checkTermisAndConditios: $presenter.checkTermisAndConditios)
                        .padding(.horizontal, 30)
                    
                    Button {
                        presenter.register {
                            router.tabView = true
                        }
                    } label: {
                        Text("Aceptar")
                            .font(.monserrat(weight: .light, .size16))
                            .foregroundStyle(Color.fontPurple)
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
                    .padding(.top, 30)
                }
                .frame(maxWidth: .infinity)
                .navigationBarBackButtonHidden()
                .padding(.bottom, 20)
                .alert("Alerta", isPresented: $presenter.showError) {
                    Button("OK") {}
                } message: {
                    Text(presenter.errorText)
                }
                if presenter.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .scaleEffect(1.5)
                        .padding()
                }
            }
        }
    }
}

#Preview {
    RegisterView()
}

