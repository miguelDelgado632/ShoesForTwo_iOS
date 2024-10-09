//
//  ShoeSlideView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 18/09/24.
//

import SwiftUI

struct ShoeSlideView: View {
  @Binding var currentSelection: Int
//  @Binding var shoes: [Shoe]
  @Binding var shoes: [ShoeProductElementModel]

  private let constants: ShoeSlideConstants = .init()

  var body: some View {
    ZStack {
      LateralArrowsView()
      TabView(selection: $currentSelection) {
        ForEach(shoes.indices, id: \.self) { index in
          let shoe: ShoeProductElementModel = shoes[index]
          VStack(spacing: .zero) {
//            Image(systemName: shoe.images[constants.middleImageIndex])
//              .resizable()
//              .frame(width: constants.imageSize, height: constants.imageSize)

            ImageDownloaderView(imageUrl: shoe.product.images[constants.middleImageIndex])
              .frame(width: constants.imageSize, height: constants.imageSize)

            VStack(spacing: .zero) {
              Text(shoe.product.name)
                .font(.monserrat(weight: .regular, .size20))
                .foregroundStyle(Color.fontGray)
              Text("$\(shoe.product.price)")
                .font(.monserrat(weight: .regular, .size20))
                .foregroundStyle(Color.fontGray)
            }
          }
          .offset(y: constants.contentOffset)
          .frame(width: constants.contentSize, height: constants.contentSize)
          .overlay(
            Circle()
              .stroke(Color.black, lineWidth: constants.contentStrokeWidth)
          )
          .onTapGesture {
            print("shoe selected at: \(currentSelection)")
          }
          .tag(index)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
    }
  }
}

#Preview {
  return ShoeSlideView(currentSelection: .constant(0),
                       shoes: .constant(.mockedData()))
}

private struct LateralArrowsView: View {
  var body: some View {
    HStack(alignment: .center) {
      Image("flecha_izq")
        .resizable()
        .frame(width: 15, height: 40)
      Spacer()
      Image("flecha_der")
        .resizable()
        .frame(width: 15, height: 40)
    }
    .padding(.horizontal, 16)
  }
}

fileprivate struct ShoeSlideConstants {
  var middleImageIndex: Int { 1 }
  var imageSize: CGFloat { 200 }
  var contentOffset: CGFloat { -15 }
  var contentSize: CGFloat { 300 }
  var contentStrokeWidth: CGFloat { 1 }
}
