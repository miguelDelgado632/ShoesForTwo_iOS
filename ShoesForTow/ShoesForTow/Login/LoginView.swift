//
//  LoginView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 18/09/24.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var presenter: LoginViewPresenter = .init()
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
                }
                .padding(.bottom, 47)
                
                VStack(spacing: 27) {
                    Button {
                      router.navigate(to: .tabHomeView)
                    } label: {
                        Text("Ingresar")
                            .font(.poppins(weight: .light, .size16))
                            .foregroundStyle(Color.fontPurple)
                    }
                    .frame(width: 176, height: 35)
                    .background(Color.backgroundColor)
//                    .disabled(!email.isValidEmail)
                    
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

final class LoginViewPresenter: ObservableObject {
  @Published var navigation: ShoesForTwoNavigation = .init()

  func showHomeScreen() {
    navigation.shouldShowTabHomeView = true
  }
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
}
