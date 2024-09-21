//
//  PrimaryButton.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 20/09/24.
//

import SwiftUI

struct PrimaryButton: View {
  let action: () -> Void
  let title: String
  let width: CGFloat
  var height: CGFloat = 30

  private let constants: PrimaryButtonConstants = .init()

  var body: some View {
    Button(action: action) {
      Text(title)
        .foregroundColor(.fontGray)
        .font(.poppins(weight: .light, .size20))
    }
    .frame(width: width, alignment: .center)
    .padding(.vertical, constants.verticalPading)
    .background(
      Rectangle()
        .foregroundColor(.gray.opacity(constants.backgroundOpacity))
    )
  }
}

#Preview {
  PrimaryButton(action: {}, title: "test", width: 200)
}

fileprivate struct PrimaryButtonConstants {
  var verticalPading: CGFloat { 6 }
  var backgroundOpacity: CGFloat { 0.5 }
}
