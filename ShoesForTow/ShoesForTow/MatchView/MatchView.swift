//
//  MatchView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

struct MatchView: View {
    
    @EnvironmentObject var router: Router
    @ObservedObject var presenter: MatchPresenter = .init()
    
    @State var showingPopup = false
    
    var body: some View {
        
        VStack(spacing: 36) {
            TabBarCustom(title: "!Hiciste Match!")
            
            HStack(spacing: -25) {
                shoeDetailDataView(name: "usuario 1",
                                   userImage: "person",
                                   shoeImage: .leftShoeTest,
                                   shoeName: "zapatofono",
                                   shoePrice: "$500",
                                   backgroundColor: .fontPurple)
                
                shoeDetailDataView(name: "usuario 2",
                                   userImage: "person.fill",
                                   shoeImage: .rightShoeTest,
                                   shoeName: "zapatofono",
                                   shoePrice: "$500",
                                   backgroundColor: .fontGray)
            }

            Button {
                showingPopup = true // 2
            } label: {
                Text("Invita \("usuario2") a comprar este modelo contigo")
                    .font(.poppins(weight: .regular, .size14))
                    .foregroundStyle(Color.fontGray)
                    .multilineTextAlignment(.center)
                    .padding(16)
                    .background(
                        Rectangle()
                            .foregroundColor(.backgroundColor)
                            .frame(height: 70)
                    )
            }
            .padding(.horizontal, 32)
            .frame(height: 70)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Compartir en:")
                    .font(.poppins(weight: .regular, .size14))
                
                HStack(spacing: 16) {
                    Button(action: {
                        presenter.goToSharedInWhatsApp(network: .email)
                    }, label: {
                        Image("icono_mail")
                            .resizable()
                            .frame(width: 40, height: 40)
                    })
                    
                    Button(action: {
                        presenter.goToSharedInWhatsApp(network: .whatsApp)
                    }, label: {
                        Image("icono_whats")
                            .resizable()
                            .frame(width: 40, height: 40)
                    })
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .onAppear{
            self.presenter.setup(self.router)
        }
        .popup(isPresented: $showingPopup) {
                    ZStack {
                        Rectangle()
                        .frame(maxWidth: .infinity)
                        .frame(height: 530)
                        .border(Color.fontGray)
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 20)
                        Text("PopUP")
                    }
                }
    }
    
    private func shoeDetailDataView(name: String,
                                    userImage: String,
                                    shoeImage: TestImages,
                                    shoeName: String,
                                    shoePrice: String,
                                    backgroundColor: Color) -> some View {
        VStack(spacing: .zero) {
            VStack(spacing: 8) {
                Text(name)
                    .font(.poppins(weight: .regular, .size12))
                CircularImageView(systemImageName: userImage, size: 60)
            }
            .offset(y: 30)
            
            ShoeDetailView(image: shoeImage,
                           name: shoeName,
                           price: shoePrice,
                           backgroundColor: backgroundColor,
                           componentSize: 200)
        }
    }
}

#Preview {
    MatchView()
}

