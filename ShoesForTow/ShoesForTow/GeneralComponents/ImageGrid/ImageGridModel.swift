//
//  ImageGridModel.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import Foundation

struct ImageGridModel: Hashable, Codable {
  let image: String
  let title: String
  let subTitle: String?
}

extension [ImageGridModel] {
  static func testData(numOfData: Int = 10) -> Self {
    var data: [ImageGridModel] = []
    for i in 1...numOfData {
      data.append(ImageGridModel(
        image: "\(i)",
        title: "\(i)",
        subTitle: "$\(i)")
      )
    }
    return data
  }
}
