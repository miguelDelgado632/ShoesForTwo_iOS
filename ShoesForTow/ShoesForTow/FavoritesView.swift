//
//  FavoritesView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 02/10/24.
//

import SwiftUI

struct FavoritesView: View {

  @ObservedObject var presenter: FavoritesPresenter = .init()

  var body: some View {
    ImageGridView(data: presenter.data)
  }
}

#Preview {
  FavoritesView()
}
