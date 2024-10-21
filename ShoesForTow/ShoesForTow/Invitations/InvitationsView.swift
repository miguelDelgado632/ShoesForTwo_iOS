//
//  InvitationsView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI

struct InvitationsView: View {
    
    @ObservedObject var presenter: InvitationsPresenter = .init()
    @EnvironmentObject var router: ProfileRouter
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        TabBarCustom(title: "Invitaciones", customRouter: router)
                        
                        ForEach(presenter.invitationData, id: \.self) { data in
                            HStack(spacing: 23) {
                                InvitationsCard(componentSize: geometry.size.width * 0.25,
                                                imageOwner: data.leftImage,
                                                imageMatch: data.rightImage)
                                VStack(spacing: 5) {
                                    Text(data.name)
                                        .font(.monserrat(weight: .semiBold, .size14))
                                        .foregroundStyle(Color.fontGray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text(data.productName)
                                        .font(.monserrat(weight: .regular, .size14))
                                        .foregroundStyle(Color.fontGray)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    PrimaryButton(action: {
                                        
                                    },
                                                  title: "Completar compra",
                                                  width: 123,
                                                  height: 20,
                                                  font: .monserrat(weight: .regular, .size12))
                                }
                                Spacer()
                            }
                            .frame(maxWidth: . infinity)
                            .padding(.horizontal, 20)
                            .padding(.top, 20)
                        }
                    }
                    .navigationBarBackButtonHidden()
                }
            }
        }
    }
}

#Preview {
    InvitationsView()
}

struct InvitationsCard: View {
    
    let componentSize: CGFloat
    var imageOwner: String
    var imageMatch: String
    
    var body: some View {
        HStack(alignment: .center, spacing: -25) {
            ShoeDetailView(image: .leftShoeTest,
                           imageUrl: imageOwner,
                           backgroundColor: .fontRed,
                           componentSize: componentSize,
                           backgroundOpacity: 0.15)
            
            ShoeDetailView(image: .rightShoeTest,
                           imageUrl: imageMatch,
                           backgroundColor: .fontPurple,
                           componentSize: componentSize,
                           backgroundOpacity: 0.15)
        }
    }
}
