//
//  UImage+Extensions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 03/10/24.
//

import SwiftUI

extension UIImage {
    func toPngString() -> String? {
        let data = self.pngData()
        return data?.base64EncodedString(options: .endLineWithLineFeed)
    }
}
