//
//  AnglesComponentView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import SwiftUI

struct AnglesComponentView: View {
  @Binding var images: [String]

  private let constants: AnglesComponentConstants = .init()

  var body: some View {
    HStack(spacing: constants.hSpacing) {
      ButtomImageView(
        image: images[constants.indexZero],
        size: constants.lateralImagesSize,
        action: {
          updateImages(at: constants.indexZero)
        }
      )
      .offset(y: constants.lateralImagesOffset)
      ButtomImageView(
        image: images[constants.indexOne],
        size: constants.centerImageSize,
        action: {
          updateImages(at: constants.indexOne)
        }
      )
      ButtomImageView(
        image: images[constants.indexTwo],
        size: constants.lateralImagesSize,
        action: {
          updateImages(at: constants.indexTwo)
        }
      )
      .offset(y: constants.lateralImagesOffset)
    }
  }

  private func updateImages(at index: Int) {
    guard index != 1 else { return }
    let selectedImage: String = images[index]
    let centerImage: String = images[1]
    images[1] = selectedImage
    images[index] = centerImage
  }
}

fileprivate struct ButtomImageView: View {
  let image: String
  let size: CGFloat
  let action: () -> Void

  var body: some View {
    Button(action: action,
           label: {
      ImageDownloaderView(imageUrl: image)
        .frame(width: size, height: size)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.black, lineWidth: 1))
        .shadow(radius: 5)
    })
    .buttonStyle(.plain)
  }
}

#Preview {
  @State var images: [String] = ["star", "heart", "moon"]
  return AnglesComponentView(images: $images)
}

fileprivate struct AnglesComponentConstants {
  var hSpacing: CGFloat { 16 }
  var lateralImagesSize: CGFloat { 40 }
  var centerImageSize: CGFloat { 60 }
  var indexZero: Int { .zero }
  var indexOne: Int { 1 }
  var indexTwo: Int { 2 }
  var lateralImagesOffset: CGFloat { -10 }
}
