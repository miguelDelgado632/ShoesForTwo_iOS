//
//  ShoeDetailView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

struct ShoeDetailView: View {

  let image: TestImages
  //  let image: String
  var name: String?
  var side: String?
  var price: String?
  var backgroundColor: Color = .fontPurple
  var componentSize: CGFloat = 300
  var backgroundOpacity: CGFloat = 0.2
  var titleFont: Font = .monserrat(weight: .regular, .size14)
  var subtitleFont: Font = .monserrat(weight: .regular, .size12)
  var footerFont: Font = .monserrat(weight: .regular, .size16)

  private var imageSize: CGFloat {
    componentSize * 0.63
  }

  var body: some View {
    VStack(alignment: .center, spacing: .zero) {
      Image(image.rawValue)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: imageSize, height: imageSize)

      VStack(spacing: .zero) {
        if let name = name {
          Text(name)
            .foregroundColor(.fontGray)
            .font(titleFont)
        }
        if let side = side {
          Text(side)
            .foregroundColor(.fontGray)
            .font(subtitleFont)
        }
        if let price = price {
          Text(price)
            .foregroundColor(.fontGray)
            .font(footerFont)
        }
      }
    }
    .frame(width: componentSize, height: componentSize)
    .background(
      Circle()
        .foregroundColor(backgroundColor.opacity(backgroundOpacity))
    )
  }
}

#Preview {
  ShoeDetailView(image: .rightShoeTest)
}
