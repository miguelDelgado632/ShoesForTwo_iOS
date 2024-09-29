//
//  ImageGridView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import SwiftUI

struct ImageGridView: View {

  let data: [ImageGridModel]
  var title: String = "Likes"

  // Define a 3-column grid layout
  let columns = [
    GridItem(.flexible()), // First column
    GridItem(.flexible()), // Second column
    GridItem(.flexible())  // Third column
  ]

  var body: some View {
    GeometryReader { geometry in
      VStack {
        Text(title)
          .font(.monserrat(weight: .regular, .size16))
          .foregroundStyle(Color.fontRed)
          .frame(maxWidth: .infinity, alignment: .leading)

        ScrollView {
          LazyVGrid(columns: columns, spacing: 8) {
            ForEach(data, id: \.self) { shoe in
              VStack {
                ShoeDetailView(image: .leftShoeTest, componentSize: (geometry.size.width / 3) - 16)
                Text(shoe.title)
                  .font(.monserrat(weight: .regular, .size14))
                  .foregroundStyle(Color.fontGray)
                if let subTitle = shoe.subTitle {
                  Text(subTitle)
                    .font(.monserrat(weight: .regular, .size16))
                    .foregroundStyle(Color.fontGray)
                }
              }
            }
          }
        }
      }
    }
    .padding(.horizontal, 32)
  }
}

struct ImageGridView_Previews: PreviewProvider {
  static var previews: some View {
    ImageGridView(data: [ImageGridModel].testData())
  }
}
