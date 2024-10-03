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

    var body: some View {
      ZStack {
        VStack {
          Image("logoLogin_icon")
            .resizable()
            .frame(width: 137, height: 160)
            .padding(.bottom, 64)
          VStack(spacing: 10) {
            TextField("Correo", text: $presenter.email)
              .font(.monserrat(weight: .light, .size16))
              .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
              .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
              .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
              .font(.monserrat(weight: .light, .size16))
              .foregroundStyle(Color.fontGray)
              .border(Color.fontGray)
              .textFieldStyle(.roundedBorder)
              .frame(height: 35)
              .padding(.top, 11)
              .padding(.horizontal, 30)
            SecureField("Contraseña", text: $presenter.password)
              .font(.monserrat(weight: .light, .size16))
              .foregroundStyle(Color.fontGray)
              .border(Color.fontGray)
              .textFieldStyle(.roundedBorder)
              .textContentType(.password)
              .frame(height: 35)
              .padding(.top, 11)
              .padding(.horizontal, 30)
          }
          .padding(.bottom, 47)

          VStack(spacing: 27) {
            Button {
              presenter.login {
                router.tabView = true
              }
            } label: {
              Text("Ingresar")
                .font(.monserrat(weight: .light, .size16))
                .foregroundStyle(Color.fontPurple)
            }
            .frame(width: 176, height: 35)
            .background(Color.backgroundColor)

            Button {
              router.navigate(to: .registerView)
            } label: {
              Text("Crear cuenta")
                .font(.monserrat(weight: .light, .size16))
                .foregroundStyle(Color.fontPurple)
            }
            .frame(width: 176, height: 35)
            .background(Color.backgroundColor)
          }

          Spacer()
        }
        .padding(.top, 40)
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
