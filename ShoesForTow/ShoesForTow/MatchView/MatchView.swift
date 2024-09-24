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
                showingPopup = true 
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
        .popup(isPresented: $showingPopup, tapAction: presenter.tapActionPopup) {
            ZStack {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 530)
                    .border(Color.fontGray)
                    .foregroundStyle(Color.white)
                    .padding(.horizontal, 20)
                VStack {
                    Image("")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                VStack {
                    Text("Has invitado a usuario 2 a hacer match contigo")
                        .frame(height: 70)
                        .font(.poppins(weight: .regular, .size20))
                        .foregroundStyle(Color.fontPurple)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 32)
                    
                    HStack(spacing: -25) {
                        shoeDetailDataView(name: "usuario 1",
                                           userImage: "person",
                                           shoeImage: .leftShoeTest,
                                           backgroundColor: .fontPurple,
                                           componentSize: 170)
                        
                        shoeDetailDataView(name: "usuario 2",
                                           userImage: "person.fill",
                                           shoeImage: .rightShoeTest,
                                           backgroundColor: .fontGray,
                                           componentSize: 170)
                    }
                }
                
            }
        }
        
    }
    
    private func shoeDetailDataView(name: String,
                                    userImage: String,
                                    shoeImage: TestImages,
                                    shoeName: String? = nil,
                                    shoePrice: String? = nil,
                                    backgroundColor: Color,
                                    componentSize: CGFloat = 200) -> some View {
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
                           componentSize: componentSize)
        }
    }
}

#Preview {
    MatchView()
}

