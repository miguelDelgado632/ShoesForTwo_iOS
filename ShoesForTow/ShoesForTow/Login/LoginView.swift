//
//  LoginView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 18/09/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var router: Router
    @State private var email: String = ""
    @State private var password: String = ""
    
    
    var body: some View {
            VStack {
                Image("logoLogin_icon")
                    .resizable()
                    .frame(width: 137, height: 160)
                    .padding(.bottom, 64)
                VStack(spacing: 10) {
                    TextField("Correo", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .border(Color.fontGray)
                        .foregroundStyle(Color.fontGray)
                        .font(.poppins(weight: .light, .size16))
                        .frame(width: 335, height: 35)
                    TextField("Contraseña", text: $password)
                        .font(.poppins(weight: .light, .size16))
                        .foregroundStyle(Color.fontGray)
                        .border(Color.fontGray)
                        .textFieldStyle(.roundedBorder)
                        .frame(width: 335, height: 35)
                }
                .padding(.bottom, 47)
                
                VStack(spacing: 27) {
                    Button {
                    } label: {
                        Text("Ingresar")
                            .font(.poppins(weight: .light, .size16))
                            .foregroundStyle(Color.fontPurple)
                        
                        
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
                    
                    Button {
                        router.navigate(to: .registerView)
                    } label: {
                        Text("Crear cuenta")
                            .font(.poppins(weight: .light, .size16))
                            .foregroundStyle(Color.fontPurple)
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
                }
                
                Spacer()
            }
            .padding(.top, 197)
    }
}
