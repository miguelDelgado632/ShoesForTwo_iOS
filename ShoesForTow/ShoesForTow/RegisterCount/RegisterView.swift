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
                TabBarCustom()
                TextFieldCustom(nameTextField: "Nombres", text: $presenter.name)
                    .padding(.top, 45)
                TextFieldCustom(nameTextField: "Apellidos", text: $presenter.apellido)
                    .padding(.top, 11)
                TextField("Correo", text: $presenter.email)
                    .font(.poppins(weight: .light, .size16))
                    .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
                    .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
                    .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
                    .font(.poppins(weight: .light, .size16))
                    .foregroundStyle(Color.fontGray)
                    .border(Color.fontGray)
                    .textFieldStyle(.roundedBorder)
                    .frame(width: 335, height: 35)
                    .padding(.top, 11)
                SecureField("Contraseña", text: $presenter.password)
                    .font(.poppins(weight: .light, .size16))
                    .foregroundStyle(Color.fontGray)
                    .border(Color.fontGray)
                    .textFieldStyle(.roundedBorder)
                    .textContentType(.password)
                    .frame(width: 335, height: 35)
                    .padding(.top, 11)
                Text("Genero")
                    .frame(width: 320, height: 35, alignment: .leading)
                    .font(.poppins(weight: .extraBold, .size14))
                    .padding(.top, 34)
                ShowGenderRegister(genders: .constant(["Hombre", "Mujer", "Otro"]),
                                   selectedGender: $presenter.selectedGender)
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
                    .frame(width: 320, height: 35, alignment: .leading)
                    .font(.poppins(weight: .extraBold, .size14))
                    .padding(.top, 34)
                ShowGenderRegister(genders: .constant(["Izquierdo", "Derecho"]),
                                   selectedGender: $presenter.selectedGender)
                
                SetPerfilImageView(selectedImage: $presenter.selectedImage)
                
                CheckTermsAndConditions(checkTermisAndConditios: $presenter.checkTermisAndConditios)
                
                Button {
                    router.navigateBack()
                } label: {
                    Text("Aceptar")
                        .font(.poppins(weight: .light, .size16))
                        .foregroundStyle(Color.fontPurple)
                }
                .frame(width: 176, height: 35)
                .background(Color.backgroundColor)
                .padding(.top, 30)
            }
            .frame(maxWidth: .infinity)
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    RegisterView()
}

