//
//  CompletePurchaseView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 24/09/24.
//

import SwiftUI

struct CompletePurchaseView: View {

  @EnvironmentObject var router: Router
  let shoeName: String

  private let constants: CompletePurchaseConstants = .init()

  var body: some View {
    VStack {
      ShoeDetailView(image: .leftShoeTest,
                     name: shoeName,
                     side: "izquierdo",
                     price: "$600",
                     backgroundOpacity: constants.shoeOpacity,
                     titleFont: .monserrat(weight: .regular, .size12),
                     subtitleFont: .monserrat(weight: .regular, .size16))

        PrimaryButton(action: { router.navigate(to: .purchaseSendInformationView(shoeName)) },
                    title: constants.buttonTitle,
                    width: constants.buttonWidth,
                    height: constants.buttonHeight,
                    font: .monserrat(weight: .regular, .size16))
      .padding(.top, constants.buttonPaddingTop)
    }
    .navigationBarBackButtonHidden()
  }
}

#Preview {
  CompletePurchaseView(shoeName: "ConverseshoeName")
}

private struct CompletePurchaseConstants {
  var buttonWidth: CGFloat { 220 }
  var buttonHeight: CGFloat { 32 }
  var buttonPaddingTop: CGFloat { 72 }
  var buttonTitle: String { "Completa tu compra" }
  var shoeOpacity: CGFloat { 0.13 }
  var tabBarPaddingBottom: CGFloat { 77 }
}
