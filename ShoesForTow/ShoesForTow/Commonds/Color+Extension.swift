//
//  Color+Extension.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 18/09/24.
//

import SwiftUI

enum ColorName: String {
  case fontGray = "#595959"
  case fontPurple = "#563a82"
  case backgroundColor = "#f1eefa"
  case fontRed = "#b64485"
}

extension Color {
  /// fontGray = "#595959"
  static let fontGray: Color = .init(colorName: .fontGray)
  /// fontpurple = "#563a82"
  static let fontPurple: Color = .init(colorName: .fontPurple)
  /// backgroundColor = "#f1eefa"
  static let backgroundColor: Color = .init(colorName: .backgroundColor)
  /// fontRed = "#b64485"
  static let fontRed: Color = .init(colorName: .fontRed)

  

  private init(colorName: ColorName) {
    var cleanHexCode = colorName.rawValue.trimmingCharacters(in: .whitespacesAndNewlines)
    cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
    print(cleanHexCode)
    var rgb: UInt64 = 0

    Scanner(string: cleanHexCode).scanHexInt64(&rgb)

    let redValue = Double((rgb >> 16) & 0xFF) / 255.0
    let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
    let blueValue = Double(rgb & 0xFF) / 255.0
    self.init(red: redValue, green: greenValue, blue: blueValue)
  }
}
