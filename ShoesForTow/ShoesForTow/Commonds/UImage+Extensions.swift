//
//  UImage+Extensions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 03/10/24.
//

import SwiftUI

extension UIImage {
    func toPngString() -> String? {
        let size = CGSize(width: 30.0, height: 30.0)
        let aspectScaledToFitImage = self.resized(to: size)
        return aspectScaledToFitImage.jpegData(compressionQuality: 0)?.base64EncodedString(options: .endLineWithLineFeed)
    }

    public func resized(to target: CGSize) -> UIImage {
            let ratio = min(
                target.height / size.height, target.width / size.width
            )
            let new = CGSize(
                width: size.width * ratio, height: size.height * ratio
            )
            let renderer = UIGraphicsImageRenderer(size: new)
            return renderer.image { _ in
                self.draw(in: CGRect(origin: .zero, size: new))
            }
        }
}
