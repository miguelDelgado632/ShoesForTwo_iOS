//
//  MatchView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

struct MatchView: View {

  @EnvironmentObject var router: MatchRouter
  @ObservedObject var presenter: MatchPresenter = .init()
  @State private var showingPopup = false
  private let constants: MatchViewConstants = .init()
  private let texts: MatchViewTexts = .init()

  var body: some View {
    GeometryReader { geometry in
      VStack(alignment: .center, spacing: constants.contentVSpacing) {
          TabBarCustom(title: texts.title,
                       showBack: false,
                       titleFont: .monserrat(weight: .regular, .size16))

        HStack(alignment: .center, spacing: constants.shoesMatchSpacing) {
          MatchShoeDetailView(name: "usuario 1",
                              userImage: "person",
                              shoeImage: .leftShoeTest,
                              shoeName: "zapatofono",
                              shoePrice: "$500",
                              backgroundColor: .fontRed,
                              componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                              opacity: constants.leftShoeDetailOpacity)

          MatchShoeDetailView(name: "usuario 2",
                              userImage: "person.fill",
                              shoeImage: .rightShoeTest,
                              shoeName: "zapatofono",
                              shoePrice: "$500",
                              backgroundColor: .fontPurple,
                              componentSize: geometry.size.width * constants.shoeDetailMultiplier,
                              opacity: constants.rightShoeDetailOpacity)
        }

        Button {
          showingPopup = true
        } label: {

          Group {
            Text(texts.inviteTo) +
            Text("usuario 2")
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
              presenter.goToSharedInWhatsApp(network: .email)
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
    }
    .navigationBarBackButtonHidden()
    .popup(isPresented: $showingPopup, tapAction: popUpTapped) {
      MatchInvitationView(userName: "usuario 1",
                          userImage: "person",
                          userMatchedName:  "usuario 2",
                          userMatchedImage: "person.fill")
    }
  }

  private func popUpTapped() {
    router.navigate(to: .completePurchase("Converse 1"))
  }
}

#Preview {
  MatchView()
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
  var title: String { "!Hiciste Match!" }
  var inviteTo: String { "Invita a " }
  var buyThisModel: String { " a comprar este modelo contigo" }
  var shareIn: String { "Compartir en:" }
}