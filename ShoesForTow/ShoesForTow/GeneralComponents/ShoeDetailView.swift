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

  private let backgroundOpacity: CGFloat = 0.2

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
            .font(.poppins(weight: .regular, .size14))
        }
        if let side = side {
          Text(side)
            .foregroundColor(.fontGray)
            .font(.poppins(weight: .regular, .size12))
        }
        if let price = price {
          Text(price)
            .foregroundColor(.fontGray)
            .font(.poppins(weight: .regular, .size16))
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
