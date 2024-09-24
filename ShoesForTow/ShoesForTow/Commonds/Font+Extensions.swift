//
//  Font+Extensions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 18/09/24.
//

import SwiftUI

enum FontName: String  {
  case black = "Montserrat-Black"
  case bold = "Montserrat-Bold"
  case extraBold = "Montserrat-ExtraBold"
  case light = "Montserrat-Light"
  case medium = "Montserrat-Medium"
  case regular = "Montserrat-Regular"
  case semiBold = "Montserrat-SemiBold"
}

/// enum of font sizes
enum FontSize: CGFloat {
  case size8 = 8.0
  case size10 = 10.0
  case size12 = 12.0
  case size14 = 14.0
  case size16 = 16.0
  case size18 = 18.0
  case size20 = 20.0
  case size52 = 24.0
  case size40 = 40.0
  case size60 = 60
}

extension Font {
  static func poppins(weight: FontName, _ size: FontSize) -> Font {
    Font.custom(weight.rawValue, fixedSize: size.rawValue)
  }

  static func poppins(weight: FontName, _ size: CGFloat) -> Font {
    Font.custom(weight.rawValue, fixedSize: size)
  }
}
