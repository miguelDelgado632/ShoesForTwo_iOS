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
    
    @State private var name: String = ""
    @State private var apellido: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedGender: String = ""
    @State private var shoesSize: String? = nil
    @State private var selectedImage: UIImage?
    @State private var checkTermisAndConditios: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                TabBarCustom()
                TextFieldCustom(nameTextField: "Nombres", text: $name)
                    .padding(.top, 45)
                TextFieldCustom(nameTextField: "Apellidos", text: $apellido)
                    .padding(.top, 11)
                TextField("Correo", text: $email)
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
                SecureField("Contraseña", text: $password)
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
                                   selectedGender: $selectedGender)
                DropDownPicker(
                    selection: $shoesSize,
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
                                   selectedGender: $selectedGender)
                
                SetPerfilImageView(selectedImage: $selectedImage)
                
                CheckTermsAndConditions(checkTermisAndConditios: $checkTermisAndConditios)
                
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

