//
//  CircularImageView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import SwiftUI

struct CircularImageView: View {
  let imageName: String
  let size: CGFloat
  var addBorder: Bool = true
  var addShadow: Bool = true
  private let isSystemImage: Bool // TODO: - remove when using real images

  init(systemImageName: String,
       size: CGFloat,
       addBorder: Bool = true,
       addShadow: Bool = true) {
    self.imageName = systemImageName
    self.size = size
    self.addBorder = addBorder
    self.addShadow = addShadow
    self.isSystemImage = true
  }

  init(imageName: String,
       size: CGFloat,
       addBorder: Bool = true,
       addShadow: Bool = true) {
    self.imageName = imageName
    self.size = size
    self.addBorder = addBorder
    self.addShadow = addShadow
    self.isSystemImage = false
  }

  var body: some View {
    // Image view with circular clipping and fixed size using system images
//      VStack {
      if isSystemImage {
          ImageDownloaderView(imageUrl: imageName)
              .frame(width: size, height: size)
              .clipShape(Circle())
              .if(addBorder) { view in
                  view.overlay(Circle().stroke(Color.black, lineWidth: 1))
              }
              .if(addShadow) { view in
                  view.shadow(radius: 5) // Optional shadow
              }
      } else {
          Image(imageName)
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: size, height: size)
                 .clipShape(Circle())
                 .if(addBorder) { view in
                   view.overlay(Circle().stroke(Color.black, lineWidth: 1))
                 }
                 .if(addShadow) { view in
                   view.shadow(radius: 5) // Optional shadow
                 }
      }
 //     }

 //   if isSystemImage {
 //     return Image(systemName: imageName)
 //       .resizable()
 //       .aspectRatio(contentMode: .fit)
 //       .frame(width: size, height: size)
 //       .clipShape(Circle())
 //       .if(addBorder) { view in
 //         view.overlay(Circle().stroke(Color.black, lineWidth: 1))
 //       }
 //       .if(addShadow) { view in
 //         view.shadow(radius: 5) // Optional shadow
 //       }
 //   } else {
 //     return Image(imageName)
 //       .resizable()
 //       .aspectRatio(contentMode: .fit)
 //       .frame(width: size, height: size)
 //       .clipShape(Circle())
 //       .if(addBorder) { view in
 //         view.overlay(Circle().stroke(Color.black, lineWidth: 1))
 //       }
 //       .if(addShadow) { view in
 //         view.shadow(radius: 5) // Optional shadow
 //       }
 //   }
  }
}

#Preview {
  CircularImageView(systemImageName: "moon", size: 250)
}

extension View {
  // Custom modifier to conditionally apply shadow
  @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
    if condition {
      transform(self)
    } else {
      self
    }
  }
}
