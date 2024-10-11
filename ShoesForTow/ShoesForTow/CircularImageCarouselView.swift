//
//  CarouselView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 18/09/24.
//

import SwiftUI

struct CircularImageCarouselView: View {
  @Binding var systemImageNames: [ShoeProductFavorite]
  let action: (String) -> Void
  private let constants: CircularImageCarouselConstants = .init()

  var body: some View {
    ScrollViewReader { proxy in
      GeometryReader { geometry in
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: constants.hStackSpacing) {
            ForEach(systemImageNames.indices, id: \.self) { index in
              GeometryReader { itemGeometry in
                let scale = getScaleFactor(itemFrame: itemGeometry.frame(in: .global),
                                           parentSize: geometry.size)
                Button {
                    action(systemImageNames[index].userId) // replace for user ID
                } label: {
                    CircularImageView(systemImageName: systemImageNames[index].picture,
                                    size: constants.size,
                                    addBorder: false)
                }
                .scaleEffect(scale)
                .animation(.spring(), value: scale) // Animate the scaling effect
                .buttonStyle(.plain)

              }
              .frame(width: constants.size, height: constants.size) // Set the frame of each image
              .tag(index)
            }
          }
          .padding(.horizontal, (geometry.size.width - constants.size) / 2) // Ensure the first and last images are centered properly
          .frame(maxHeight: constants.maxHeight, alignment: .center)
        }
        .onChange(of: systemImageNames, perform: { _ in
          withAnimation(.spring) {
            proxy.scrollTo(0, anchor: .center)
          }
        })
      }
    }
//    .frame(height: 200) // Set the height of the carousel
  }

  // Calculate the scale factor based on the position of the image
  private func getScaleFactor(itemFrame: CGRect, parentSize: CGSize) -> CGFloat {
    let midX = parentSize.width / 2
    let distanceFromCenter = abs(itemFrame.midX - midX)
    let maxDistance = parentSize.width / 2
    let scale = max(1.0, constants.maxScale - (distanceFromCenter / maxDistance))
    return scale
  }
}

//#Preview {
//  @State var systemImageNames: [String] = ["star", "heart", "moon", "sun.max", "cloud"]
//  return CircularImageCarouselView(systemImageNames: $systemImageNames, action: { _ in })
//    .overlay(
//      Rectangle()
//        .frame(maxWidth: 5, maxHeight: .infinity, alignment: .center)
//    )
//}

fileprivate struct CircularImageCarouselConstants {
  var size: CGFloat { 34 }
  var maxScale: CGFloat { 1.5 }
  var maxHeight: CGFloat { 70 }
  var hStackSpacing: CGFloat { 30 }
}
