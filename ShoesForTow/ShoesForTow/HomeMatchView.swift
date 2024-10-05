//
//  HomeMatchView.swift
//  ShoesForTow
//
//  Created by Raul Alberto Torres Contreras on 18/09/24.
//

import SwiftUI

struct HomeMatchView: View {

  @ObservedObject var presenter: HomeMatchPresenter = .init()
  @EnvironmentObject var router: MatchRouter
  private let texts: HomeTexts = .init()
  private let constants: HomeConstants = .init()

  var body: some View {
    NavigationStack(path: $router.navPath) {
      ZStack {

        if presenter.isLoading {
          ProgressView()
            .progressViewStyle(CircularProgressViewStyle())
            .scaleEffect(1.5)
            .padding()
        } else if !presenter.shoeProducts.isEmpty {
          VStack(alignment: .center, spacing: .zero) {
            filtersView
            Spacer()
            shoeSelectorView
            Spacer()
            mainButtonView
            Spacer()
          }
        }
      }

      .navigationDestination(for: MatchDestination.self) { destination in
        switch destination {
        case .matchView:
          MatchView()
        case .otherUserProfile(let userId):
          OtherUserProfileView(userId: userId, data: .testData())
        case .completePurchase(let shoeName):
          CompletePurchaseView(shoeName: shoeName)
        case .purchaseSendInformationView(let shoeName):
          PurchaseSendInformationView(shoeName: shoeName)
        case .paymentConfirmation(let shoeName):
          PaymentConfirmationView(shoeName: shoeName)
        case .seeOrderStatus(let shoeName, let arriveTo):
          SeeOrderStatusView(shoeName: shoeName, arriveTo: arriveTo)
        }
      }
    }
    .navigationViewStyle(.stack)
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
        .font(.monserrat(weight: .semiBold, .size20))
        .foregroundColor(.fontRed)
        .padding(.bottom, constants.alsoLikedTitleBottonPadding)

      CircularImageCarouselView(
        systemImageNames: $presenter.users,
        action: { userId in
          router.navigate(to: .otherUserProfile(userId))
        }
      )
        .frame(height: constants.usersCarouselHeight)

      ShoeSlideView(currentSelection: $presenter.currentSelection,
                    shoes: $presenter.shoeProducts)

      AnglesComponentView(images: $presenter.shoeProducts[presenter.currentSelection].product.images)
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
//        CircularImageView(imageName: presenter.shoes[presenter.currentSelection].liked ?
//                          "icono_like" :
//                            "icono_like_relleno",
//                          size: constants.mainButtonsSize,
//                          addBorder: false)

      })
      .buttonStyle(.plain)
      Spacer()
      Button(action: {
        router.navigate(to: .matchView)
      }, label: {
        CircularImageView(imageName: "icono_match_circular",
                          size: constants.mainButtonsSize,
                          addBorder: false)
      })
      .buttonStyle(.plain)
      Spacer()
    }
  }
}

#Preview {
    HomeMatchView()
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
