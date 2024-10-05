//
//  ImageDownlaoderView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 04/10/24.
//

import SwiftUI

struct ImageDownloaderView: View {
  @State private var image: UIImage?

  private let loadingMessage: String = "Cargando..."
  private let imageUrl: String
  private let isIcon: Bool

  init(imageUrl: String,
       isIcon: Bool = false) {
    self.imageUrl = imageUrl
    self.isIcon = isIcon
  }

  var body: some View {
    if #available(iOS 15.0, *) {
      AsyncImage(
        url: URL(string: imageUrl),
        content: { img in
          img.resizable()
            .scaledToFill()
        },
        placeholder: {
          if isIcon {
            EmptyView()
          } else {
            ProgressView(loadingMessage)
          }
        }
      )
    } else {
      if let image = image {
        Image(uiImage: image)
          .resizable()
          .scaledToFill()
      } else {
        if isIcon {
          EmptyView()
            .onAppear {
              loadImage()
            }
        } else {
          ProgressView(loadingMessage)
            .onAppear {
              loadImage()
            }
        }
      }
    }
  }

  func loadImage() {
    guard let imageURL = URL(string: imageUrl) else {
      return
    }

    URLSession.shared.dataTask(with: imageURL) { data, response, error in
      guard let data = data, error == nil else {
        print("Error loading image: \(error?.localizedDescription ?? "Unknown error")")
        return
      }

      DispatchQueue.main.async {
        self.image = UIImage(data: data)
      }
    }.resume()
  }
}

#Preview {
  ImageDownloaderView(imageUrl: "http://proyectos-ddbmexico.com/Shoes/assets/productos/puma-right.png")
}
