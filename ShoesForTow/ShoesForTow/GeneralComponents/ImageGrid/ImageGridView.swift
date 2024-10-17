//
//  ImageGridView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 28/09/24.
//

import SwiftUI

struct ImageGridView: View {

  let data: [ImageGridModel] = []
  let correctData: [LikesGridModel]
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
          .font(.monserrat(weight: .semiBold, .size16))
          .foregroundStyle(Color.fontRed)
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.top, 20)
          .padding(.bottom, 33)

        ScrollView {
          LazyVGrid(columns: columns, spacing: 8) {
            ForEach(correctData, id: \.self) { shoe in
              VStack {
                  ShoeDetailView(image: .leftShoeTest, imageUrl: shoe.image, componentSize: (geometry.size.width / 3) - 16)
                Text(shoe.name)
                  .font(.monserrat(weight: .regular, .size14))
                  .foregroundStyle(Color.fontGray)
                  Text("$\(shoe.cost)")
                    .font(.monserrat(weight: .regular, .size16))
                    .foregroundStyle(Color.fontGray)
              }
            }
          }
        }
      }
    }
    .padding(.horizontal, 32)
  }
}

//struct ImageGridView_Previews: PreviewProvider {
//  static var previews: some View {
//    ImageGridView(data: [ImageGridModel].testData())
//  }
//}
