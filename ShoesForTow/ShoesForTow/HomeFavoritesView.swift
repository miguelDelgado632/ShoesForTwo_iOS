//
//  HomeFavoritesView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 18/09/24.
//

import SwiftUI

struct HomeFavoritesView: View {

  @ObservedObject var presenter: HomeFavoritesPresenter = .init()
  @EnvironmentObject var router: Router
  private let texts: HomeTexts = .init()
  private let constants: HomeConstants = .init()

  var body: some View {
    VStack(alignment: .center, spacing: .zero) {
      filtersView
      Spacer()
      shoeSelectorView
      Spacer()
      mainButtonView
      Spacer()
    }
    .onAppear{
        self.presenter.setup(self.router)
    }
  }

  private var filtersView: some View {
    HStack {
      PrimaryButton(action: { presenter.filterBy(.casual) },
                    title: texts.filterCasual,
                    width: constants.selectionIconsWidth)
      Spacer()
      PrimaryButton(action: { presenter.filterBy(.formal) },
                    title: texts.filterFormal,
                    width: constants.selectionIconsWidth)
      Spacer()
      PrimaryButton(action: { presenter.filterBy(.all) },
                    title: texts.filterAll,
                    width: constants.selectionIconsWidth)
    }
    .padding(.horizontal, constants.filtersHorizontalPadding)
    .padding(.top, constants.filtersTopPadding)
  }

  private var shoeSelectorView: some View {
    VStack(spacing: constants.shoeSelectorVerticalSpacing) {
      Text(texts.alsoLikedBy)
        .font(.poppins(weight: .semiBold, .size20))
        .foregroundColor(.fontRed)
        .padding(.bottom, constants.alsoLikedTitleBottonPadding)

      CircularImageCarouselView(systemImageNames: $presenter.users)
        .frame(height: constants.usersCarouselHeight)

      ShoeSlideView(currentSelection: $presenter.currentSelection,
                    shoes: $presenter.shoes)

      AnglesComponentView(images: $presenter.shoes[presenter.currentSelection].images)
        .offset(y: constants.anglesComponentOffset)
    }
    .frame(height: constants.shoeSelectorHeight)
  }

  private var mainButtonView: some View {
    HStack {
      Spacer()
      Button(action: {}, label: {
        CircularImageView(imageName: "icono_like",
                          size: constants.mainButtonsSize,
                          addBorder: false)
      }).buttonStyle(.plain)
      Spacer()
      Button(action: {
          presenter.wsMatch()
      }, label: {
        CircularImageView(imageName: "icono_match_circular",
                          size: constants.mainButtonsSize,
                          addBorder: false)
      }).buttonStyle(.plain)
      Spacer()
    }
  }
}

#Preview {
    HomeFavoritesView()
}

fileprivate struct HomeTexts {
  var alsoLikedBy: String { "También les gustó:" }
  var filterCasual: String { "Casual" }
  var filterFormal: String { "Formal" }
  var filterAll: String { "Todo" }
}

fileprivate struct HomeConstants {
  var filtersHorizontalPadding: CGFloat { 24 }
  var filtersTopPadding: CGFloat { 16 }
  var selectionIconsWidth: CGFloat { 106 }
  var shoeSelectorVerticalSpacing: CGFloat { 8 }
  var alsoLikedTitleBottonPadding: CGFloat { 8 }
  var shoeSelectorHeight: CGFloat { 500 }
  var anglesComponentOffset: CGFloat { -35 }
  var usersCarouselHeight: CGFloat { 80 }
  var mainButtonsSize: CGFloat { 60 }
}
