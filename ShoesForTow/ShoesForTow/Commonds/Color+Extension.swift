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
  case backColor = "#f7f6ff"
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
  /// fontRed = "#f7f6ff"
  static let backColor: Color = .init(colorName: .backColor)

  

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

extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}
