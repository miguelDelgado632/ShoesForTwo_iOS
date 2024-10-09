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
                Color.backColor
                VStack {
                    Image("logoLogin_icon")
                        .resizable()
                        .frame(width: 137, height: 160)
                        .padding(.bottom, 64)
                    VStack(spacing: 6) {
                        TextField("Correo", text: $presenter.email)
                            .padding(.leading, 10)
                            .frame(height: 35)
                            .font(.monserrat(weight: .light, .size16))
                            .background(Color.backColor)
                            .border(Color.fontGray, width: 0.7)
                            .textContentType(.emailAddress)       // !IMPORTANT FOR EMAILS
                            .disableAutocorrection(true)          // !IMPORTANT FOR EMAILS
                            .textInputAutocapitalization(.never)  // !IMPORTANT FOR EMAILS
                            .foregroundStyle(Color.fontGray)
                            .padding(.top, 11)
                            .padding(.horizontal, 30)
                            
                        SecureField("Contraseña", text: $presenter.password)
                            .padding(.leading, 10)
                            .frame(height: 35)
                            .font(.monserrat(weight: .light, .size16))
                            .background(Color.backColor)
                            .border(Color.fontGray, width: 0.7)
                            .foregroundStyle(Color.fontGray)
                            .textContentType(.password)
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
                .padding(.top, 130)
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
            .ignoresSafeArea()
            .onAppear {
                if !UserDefaults.standard.getUserID().isEmpty {
                    router.tabView = true
                }
            }
    }
}
