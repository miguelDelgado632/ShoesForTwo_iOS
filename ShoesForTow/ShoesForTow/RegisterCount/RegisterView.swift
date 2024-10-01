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
        ScrollView {
            VStack {
                TabBarCustom(title: "Crear cuenta")
                TextFieldCustom(nameTextField: "Nombres", text: $presenter.name)
                    .padding(.top, 35)
                    .padding(.horizontal, 30)
                TextFieldCustom(nameTextField: "Apellidos", text: $presenter.apellido)
                    .padding(.top, 11)
                    .padding(.horizontal, 30)
                TextField("Correo", text: $presenter.email)
                    .font(.monserrat(weight: .light, .size16))
                    .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
                    .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
                    .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
                    .font(.monserrat(weight: .light, .size16))
                    .foregroundStyle(Color.fontGray)
                    .border(Color.fontGray)
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal, 30)
                    .frame(height: 35)
                    .padding(.top, 11)
                SecureField("Contraseña", text: $presenter.password)
                    .font(.monserrat(weight: .light, .size16))
                    .foregroundStyle(Color.fontGray)
                    .border(Color.fontGray)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .frame(height: 35)
                    .padding(.horizontal, 30)
                    .padding(.top, 11)
                Text("Genero")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size14))
                    .padding(.top, 34)
                    .padding(.horizontal, 30)
                ShowGenderRegister(genders: .constant(["Hombre", "Mujer", "Otro"]),
                                   selectedGender: $presenter.selectedGender)
                .padding(.horizontal, 30)
                DropDownPicker(
                    selection: $presenter.shoesSize,
                    options: [
                        "Apple",
                        "Google",
                        "Amazon",
                        "Facebook",
                        "Instagram"
                    ]
                )
                .padding(.top, 29)
                Text("¿Que zapato buscas?")
                    .frame(height: 35, alignment: .leading)
                    .font(.monserrat(weight: .extraBold, .size14))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .padding(.top, 34)
                ShowGenderRegister(genders: .constant(["Izquierdo", "Derecho"]),
                                   selectedGender: $presenter.selectedGender)
                .padding(.horizontal, 30)
                
                SetPerfilImageView(selectedImage: $presenter.selectedImage)
                    .padding(.horizontal, 30)
                
                CheckTermsAndConditions(checkTermisAndConditios: $presenter.checkTermisAndConditios)
                    .padding(.horizontal, 30)
                
                Button {
//                    router.navigateBack()
                  presenter.register()
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
        }
    }
}

#Preview {
    RegisterView()
}

