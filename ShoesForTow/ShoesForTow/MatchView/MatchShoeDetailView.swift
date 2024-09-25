//
//  MatchShoeDetailView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 24/09/24.
//

import SwiftUI

struct MatchShoeDetailView: View {
  let name: String
  let userImage: String
  let shoeImage: TestImages
  var shoeName: String? = nil
  var shoePrice: String? = nil
  let backgroundColor: Color
  let componentSize: CGFloat
  let opacity: CGFloat

  private let constants: MatchShoeDetailConstants = .init()

  var body: some View {
    VStack(spacing: .zero) {
      VStack(spacing: constants.userVerticalSpacing) {
        Text(name)
          .font(.monserrat(weight: .regular, .size12))
        CircularImageView(systemImageName: userImage,
                          size: componentSize * constants.userImageSizeMultiplier)
      }
      .offset(y: componentSize * constants.userImageOffsetMultiplier)

      ShoeDetailView(image: shoeImage,
                     name: shoeName,
                     price: shoePrice,
                     backgroundColor: backgroundColor,
                     componentSize: componentSize,
                     backgroundOpacity: opacity)
    }
  }
}

#Preview {
  MatchShoeDetailView(name: "test", userImage: "person", shoeImage: .leftShoeTest, shoeName: "converse", shoePrice: "$600", backgroundColor: .red, componentSize: 200, opacity: 0.15)
}

private struct MatchShoeDetailConstants {
  var userVerticalSpacing: CGFloat { 8 }
  var userImageSizeMultiplier: CGFloat { 0.3 }
  var userImageOffsetMultiplier: CGFloat { 0.15 }
}
