//
//  OtherUserProfileView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 29/09/24.
//

import SwiftUI

struct OtherUserProfileView: View {

  let userId: String
  let data: [ImageGridModel]

  private let constants: OtherUserProfileCosntants = .init()
  private let texts: OtherUserProfileTexts = .init()

  var body: some View {
    GeometryReader { geometry  in
      VStack(spacing: constants.contentSpacing) {
        Image(systemName: userId)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: geometry.size.width / constants.imageFractionSize,
                 height: geometry.size.width / constants.imageFractionSize)
          .clipShape(Circle())
          .padding(.bottom, constants.imageBottomPadding)

        createInfoTexts(title: texts.name, value: "Dani Rojas")
        createInfoTexts(title: texts.size, value: "28.5")
        createInfoTexts(title: texts.lookingForShoe, value: "Derecho")
          .padding(.bottom, constants.infoBottomPadding)

        ImageGridView(data: data)
      }
    }
    .navigationBarBackButtonHidden()
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

#Preview {
  OtherUserProfileView(userId: "person.fill", data: .testData())
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
