//
//  MatchInvitationView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 24/09/24.
//

import SwiftUI

struct MatchInvitationView: View {

  let userName: String
  let userImage: String
  let userMatchedName: String
  let userMatchedImage: String

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
            Text(String(format: texts.invitationSent, userName))
              .frame(minHeight: constants.titleMinHeight)
              .font(.monserrat(weight: .regular, .size20))
              .foregroundStyle(Color.fontPurple)
              .multilineTextAlignment(.center)
              .padding(.horizontal, constants.titleHorizontalPadding)

            HStack(spacing: constants.shoesMatchSpacing) {
              MatchShoeDetailView(name: userName,
                                  userImage: userImage,
                                  shoeImage: .leftShoeTest,
                                  backgroundColor: .fontPurple,
                                  componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                  opacity: constants.leftShoeDetailOpacity)

              MatchShoeDetailView(name: userMatchedName,
                                  userImage: userMatchedImage,
                                  shoeImage: .rightShoeTest,
                                  backgroundColor: .fontGray,
                                  componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                                  opacity: constants.rightShoeDetailOpacity)
            }
          }
        }
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
  MatchInvitationView(userName: "usuario 1", userImage: "person", userMatchedName: "usuario 2", userMatchedImage: "person.fill")
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
