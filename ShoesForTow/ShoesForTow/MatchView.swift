//
//  MatchView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

struct MatchView: View {

  var body: some View {

    VStack(spacing: 36) {

      Text("!Hiciste Match!")
        .font(.poppins(weight: .semiBold, .size20))
        .foregroundColor(.fontRed)
        .padding(.top, 16)

      HStack(spacing: -25) {
        shoeDetailDataView(name: "usuario 1",
                           userImage: "person",
                           shoeImage: .leftShoeTest,
                           shoeName: "zapatofono",
                           shoePrice: "$500",
                           backgroundColor: .fontPurple)

        shoeDetailDataView(name: "usuario 2",
                           userImage: "person.fill",
                           shoeImage: .rightShoeTest,
                           shoeName: "zapatofono",
                           shoePrice: "$500",
                           backgroundColor: .fontGray)
      }

      Text("Invita \("usuario2") a comprar este modelo contigo")
        .multilineTextAlignment(.center)
        .padding(16)
        .background(
          Rectangle()
            .foregroundColor(.backgroundColor)
        )
        .padding(.horizontal, 32)

      Spacer()

      VStack(spacing: 16) {
        Text("Compartir en:")

        HStack(spacing: 16) {
          Button(action: {}, label: {
            Image("icono_mail")
              .resizable()
              .frame(width: 40, height: 40)
          })

          Button(action: {}, label: {
            Image("icono_whats")
              .resizable()
              .frame(width: 40, height: 40)
          })
        }
      }

      Spacer()
    }
  }

  private func shoeDetailDataView(name: String,
                                  userImage: String,
                                  shoeImage: TestImages,
                                  shoeName: String,
                                  shoePrice: String,
                                  backgroundColor: Color) -> some View {
    VStack(spacing: .zero) {
      VStack(spacing: 8) {
        Text(name)
        CircularImageView(systemImageName: userImage, size: 60)
      }
      .offset(y: 30)

      ShoeDetailView(image: shoeImage,
                     name: shoeName,
                     price: shoePrice,
                     backgroundColor: backgroundColor,
                     componentSize: 200)
    }
  }
}

#Preview {
  MatchView()
}

