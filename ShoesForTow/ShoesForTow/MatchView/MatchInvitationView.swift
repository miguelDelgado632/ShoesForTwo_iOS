//
//  MatchInvitationView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 24/09/24.
//

import SwiftUI

struct MatchInvitationView: View {


  @Binding var userOne: GuestUserInfo?
  @Binding var userTwo: GuestUserInfo?

  private let constants: MatchInvitationConstants = .init()
  private let texts: MatchInvitationTexts = .init()

    var body: some View {
      GeometryReader { geometry in
        ZStack {
            Color.backColor
                .ignoresSafeArea()
          Rectangle()
            .frame(maxWidth: .infinity)
            .frame(height: constants.backgroundHeight)
            .border(Color.fontGray, width: 0.7)
            .foregroundStyle(Color.backColor)
            .padding(.horizontal, constants.backgroudHorizontalPadding)

          VStack {
              Text(String(format: texts.invitationSent, userTwo?.name ?? ""))//userName))
              .frame(minHeight: constants.titleMinHeight)
              .font(.monserrat(weight: .regular, .size20))
              .foregroundStyle(Color.fontPurple)
              .multilineTextAlignment(.center)
              .padding(.horizontal, constants.titleHorizontalPadding)

            HStack(spacing: constants.shoesMatchSpacing) {
                MatchShoeDetailView(name: userOne?.name ?? "",//userName,
                                    userImage: userOne?.photo ?? "",
                                  shoeImage: .leftShoeTest,
                                  shoeImageURL: userOne?.imgProduct ?? "",
                                    backgroundColor: .fontRed,
                                    componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                    sizeBigCircle: geometry.size.width * constants.shoeDetailMultiplier,
                                    opacity: constants.leftShoeDetailOpacity)

                MatchShoeDetailView(name: userTwo?.name ?? "",//userMatchedName,
                                    userImage: userTwo?.photo ?? "",//userMatchedImage,
                                  shoeImage: .rightShoeTest,
                                  shoeImageURL: userTwo?.imgProduct ?? "",
                                    backgroundColor: .fontPurple,
                                  componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                    sizeBigCircle: geometry.size.width * constants.shoeDetailMultiplier,
                                  opacity: constants.rightShoeDetailOpacity)
            }
          }
        }
        .navigationBarBackButtonHidden()
        .overlay {
          Button(action: {}) {
            Image(systemName: constants.closeButtonImage)
              .resizable()
              .frame(width: constants.closeButtonSize, height: constants.closeButtonSize)
              .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
              .padding(.horizontal, constants.closeButtonHorizontalPadding)
              .padding(.top, constants.closeButtonTopPadding)
          }
          .buttonStyle(.plain)
        }
        .frame(maxHeight: .infinity, alignment: .center)
      }
    }
}

#Preview {
    MatchInvitationView(userOne:.constant(GuestUserInfo(idProduct: "dsad", nameProdcut: "dsad", costProduct: "dsad", imgProduct: "dsad", idUser: "dsad", name: "dsad", photo: "dsad")), userTwo: .constant( GuestUserInfo(idProduct: "dsad", nameProdcut: "dsad", costProduct: "dsad", imgProduct: "dsad", idUser: "dsad", name: "dsad", photo: "dsad")))
}

private struct MatchInvitationConstants {
  var backgroundHeight: CGFloat { 530 }
  var backgroudHorizontalPadding: CGFloat { 20 }
  var titleMinHeight: CGFloat { 70 }
  var titleHorizontalPadding: CGFloat { 32 }
  var shoesMatchSpacing: CGFloat { -25 }
  var shoeDetailMultiplier: CGFloat { 0.45 }
  var leftShoeDetailOpacity: CGFloat { 0.15 }
  var rightShoeDetailOpacity: CGFloat { 0.13 }
  var closeButtonSize: CGFloat { 30 }
  var closeButtonHorizontalPadding: CGFloat { 25 }
  var closeButtonTopPadding: CGFloat { 5 }
  var closeButtonImage: String { "xmark.app" }
}

private struct MatchInvitationTexts {
  var invitationSent: String { "Has invitado a %@ a hacer match contigo" }
}
