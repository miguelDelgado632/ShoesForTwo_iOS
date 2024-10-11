//
//  MatchView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

struct MatchView: View {
    
    @EnvironmentObject var router: MatchRouter
    @ObservedObject var presenter: MatchPresenter
    @State private var showingPopup = false
    private let constants: MatchViewConstants = .init()
    private let texts: MatchViewTexts = .init()
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            if presenter.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding()
            } else {
                GeometryReader { geometry in
                    VStack(alignment: .center, spacing: constants.contentVSpacing) {
                        TabBarCustom(title: texts.title,
                                     showBack: false,
                                     titleFont: .monserrat(weight: .regular, .size20))
                        
                        HStack(alignment: .center, spacing: constants.shoesMatchSpacing) {
                            MatchShoeDetailView(name: presenter.userOne?.name ?? "",
                                                userImage: presenter.userOne?.photo ?? "",
                                                shoeImage: .leftShoeTest,
                                                shoeImageURL: presenter.userOne?.productImage,
                                                shoeName: presenter.userOne?.productName,
                                                shoePrice: "$ \(String(describing: presenter.userOne?.productCost ?? ""))",
                                                backgroundColor: .fontRed,
                                                componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                                opacity: constants.leftShoeDetailOpacity)
                            
                            MatchShoeDetailView(name: presenter.userTwo?.name ?? "",
                                                userImage: presenter.userTwo?.photo ?? "",
                                                shoeImage: .rightShoeTest,
                                                shoeImageURL: presenter.userTwo?.productImage ?? "",
                                                shoeName: presenter.userTwo?.productName,
                                                shoePrice: "$ \(String(describing: presenter.userTwo?.productCost ?? ""))",
                                                backgroundColor: .fontPurple,
                                                componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                                opacity: constants.rightShoeDetailOpacity)
                        }
                        
                        Button {
                            presenter.sendInvitation {
                                self.showingPopup = true
                            }
                        } label: {
                            
                            Group {
                                Text(texts.inviteTo) +
                                Text("\(presenter.userTwo?.name ?? "")")
                                    .foregroundColor(.blue) +
                                Text(texts.buyThisModel)
                            }
                            .font(.monserrat(weight: .regular, .size14))
                            .foregroundColor(.fontGray)
                            .padding(constants.invitacionMessgePadding)
                            .background(
                                Rectangle()
                                    .foregroundColor(.backgroundColor)
                            )
                        }
                        .padding(.horizontal, constants.invitationHorizontalPadding)
                        .frame(minHeight: constants.invitationButtonMinHeight)
                        
                        Spacer()
                        
                        VStack(spacing: constants.shareVerticalSpacing) {
                            Text(texts.shareIn)
                                .font(.monserrat(weight: .regular, .size14))
                            
                            HStack(spacing: constants.shareHorizontalSpacing) {
                                Button(action: {
                                    presenter.goToSharedInWhatsApp(network: .facebook)
                                }, label: {
                                    Image(constants.emailIcon)
                                        .resizable()
                                        .frame(width: constants.shareIconSize, height: constants.shareIconSize)
                                })
                                
                                Button(action: {
                                    presenter.goToSharedInWhatsApp(network: .whatsApp)
                                }, label: {
                                    Image(constants.whatsIcon)
                                        .resizable()
                                        .frame(width: constants.shareIconSize, height: constants.shareIconSize)
                                })
                            }
                        }
                        Spacer()
                    }
                    .background(Color.backColor)
                    .navigationBarBackButtonHidden()
                }
                .navigationBarBackButtonHidden()
                .popup(isPresented: $showingPopup, tapAction: popUpTapped) {
                    MatchInvitationView(userOne: $presenter.userOneGuest,
                                        userTwo: $presenter.userTwoGuest)
                }
                .alert("Alerta", isPresented: $presenter.showError) {
                    Button("OK") {}
                } message: {
                    Text(presenter.errorText)
                }
            }
        }
    }
    
    private func popUpTapped() {
        router.navigate(to: .completePurchase("Converse 1"))
    }
}

#Preview {
    MatchView(presenter: MatchPresenter(productId: "fdsfd"))
}

private struct MatchViewConstants {
    var contentVSpacing: CGFloat { 36 }
    var shoesMatchSpacing: CGFloat { -25 }
    var shoeDetailMultiplier: CGFloat { 0.5 }
    var invitacionMessgePadding: CGFloat { 16 }
    var invitationHorizontalPadding: CGFloat { 32 }
    var invitationButtonMinHeight: CGFloat { 70 }
    var shareVerticalSpacing: CGFloat { 16 }
    var shareHorizontalSpacing: CGFloat { 16 }
    var shareIconSize: CGFloat { 40 }
    var emailIcon: String { "icono_mail" }
    var whatsIcon: String { "icono_whats" }
    var leftShoeDetailOpacity: CGFloat { 0.15 }
    var rightShoeDetailOpacity: CGFloat { 0.13 }
}

private struct MatchViewTexts {
    var title: String { "¡Hiciste Match!" }
    var inviteTo: String { "Invita a " }
    var buyThisModel: String { " a comprar este modelo contigo" }
    var shareIn: String { "Compartir en:" }
}
