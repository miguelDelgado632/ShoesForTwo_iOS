//
//  Image+Entensions.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 21/09/24.
//

import SwiftUI

enum TestImages: String {
  case leftShoeTest = "converse1"
  case rightShoeTest = "converse3"
  case upShoeTest = "converse2"
}

extension Image {

  init(_ testImage: TestImages) {
    self.init(testImage.rawValue)
  }
}
