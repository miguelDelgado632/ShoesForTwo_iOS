//
//  RegisterView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var router: Router

    @State private var name: String = ""
    @State private var apellido: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var selectedGender: String = ""
    @State private var shoesSize: String? = nil

    var body: some View {
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
            ShowGender(genders: .constant(["Hombre", "Mujer", "Otro"]),
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
            ShowGender(genders: .constant(["Izquierdo", "Derecho"]),
                       selectedGender: $selectedGender)
            
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterView()
}

struct ShowGender: View {
    @Binding var genders: [String]// = ["Hombre", "Mujer", "Otro"]
    @State private var allSelectedGenders = Set<String>()
    @Binding var selectedGender: String

    var body: some View {
        HStack(spacing: 40) {
            ForEach(genders, id: \.self) { gender in
                Button {
                    if allSelectedGenders.contains(gender) {
                        allSelectedGenders.remove(gender)
                    } else {
                        allSelectedGenders.removeAll()
                        allSelectedGenders.insert(gender)
                    }
                    selectedGender = gender
                } label: {
                    HStack {
                        Rectangle()
                            .frame(width: 10, height: 10)
                            .border(Color.fontGray)
                            .foregroundStyle(allSelectedGenders.contains(gender) ? Color.fontGray : Color.white)
                            
                        Text(gender)
                            .font(.poppins(weight: .light, .size14))
                            .foregroundStyle(Color.fontGray)
                    }
                }
            }
            Spacer()
        }
        .frame(width: 335, alignment: .leading)
        
    }
}
