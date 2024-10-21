//
//  OtherUserProfileView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 29/09/24.
//

import SwiftUI

struct OtherUserProfileView: View {
    
    @ObservedObject var presenter: OtherUserProfilePresenter
    
    private let constants: OtherUserProfileCosntants = .init()
    private let texts: OtherUserProfileTexts = .init()
    @EnvironmentObject var router: MatchRouter
    
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            if presenter.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .navigationBarBackButtonHidden()
                    .scaleEffect(1.5)
                    .padding()
            } else {
                GeometryReader { geometry  in
                    VStack(spacing: constants.contentSpacing) {
                        TabBarCustom(title: "", customRouter: router)
                        ImageDownloaderView(imageUrl: presenter.profileData?.photo ?? "")
                            .frame(width: geometry.size.width / constants.imageFractionSize,
                                   height: geometry.size.width / constants.imageFractionSize)
                            .clipShape(Circle())
                            .padding(.bottom, constants.imageBottomPadding)
                        
                        createInfoTexts(title: texts.name, value: presenter.profileData?.name ?? "")
                        createInfoTexts(title: texts.size, value: presenter.profileData?.size ?? "")
                        createInfoTexts(title: texts.lookingForShoe, value: presenter.profileData?.food ?? "")
                            .padding(.bottom, constants.infoBottomPadding)
                        
                        ImageGridView(correctData: presenter.likes)
                    }
                }
                .navigationBarBackButtonHidden()
                .alert("Alerta", isPresented: $presenter.showError) {
                    Button("OK") {}
                } message: {
                    Text(presenter.errorText)
                }
            }
        }
    }
    
    private func createInfoTexts(title: String, value: String) -> some View {
        Text(title)
            .font(.monserrat(weight: .regular, .size16))
            .foregroundColor(.fontGray)
        +
        Text(value)
            .font(.monserrat(weight: .semiBold, .size16))
            .foregroundColor(.fontGray)
    }
}

private struct OtherUserProfileCosntants {
    var contentSpacing: CGFloat { 8 }
    var imageFractionSize: CGFloat { 2.2 }
    var imageBottomPadding: CGFloat { 16 }
    var infoBottomPadding: CGFloat { 24 }
}

private struct OtherUserProfileTexts {
    var name: String { "Nombre: " }
    var size: String { "Talla: " }
    var lookingForShoe: String { "¿Que zapato busca?: " }
}
