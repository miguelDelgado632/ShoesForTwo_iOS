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
  @EnvironmentObject var router2: Router
  private let texts: HomeTexts = .init()
  private let constants: HomeConstants = .init()

    var body: some View {
        NavigationStack(path: $router.navPath) {
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                if presenter.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .navigationBarBackButtonHidden()
                        .scaleEffect(1.5)
                        .padding()
                } else if !presenter.shoeProducts.isEmpty {
                    VStack(alignment: .center, spacing: .zero) {
                        filtersView
                        shoeSelectorView
                        mainButtonView
                        Spacer()
                    }
                    .background(Color.backColor)
                    .alert("Alerta", isPresented: $presenter.showError) {
                        Button("OK") {}
                    } message: {
                        Text(presenter.errorText)
                    }
                    
                }
            }
            .navigationBarBackButtonHidden()
            .navigationDestination(for: MatchDestination.self) { destination in
                switch destination {
                case .matchView(let userId):
                    let presenter = MatchPresenter(productId: userId)
                    MatchView(presenter: presenter)
                case .otherUserProfile(let userId):
                    let presenter = OtherUserProfilePresenter(userIdOtherProfile: userId)
                    OtherUserProfileView(presenter: presenter)
                case .completePurchase(let shoeData):
                    CompletePurchaseView(shoeData: shoeData)
                case .purchaseSendInformationView(let shoeData):
                    let presenter = PurchaseSendInformationPresenter(productData: shoeData)
                    PurchaseSendInformationView(presenter: presenter)
                case .paymentConfirmation(let shoeName):
                    PaymentConfirmationView(shoeName: shoeName.productName)
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
    .padding(.bottom, constants.filtersBottomPadding)
  }

  private var shoeSelectorView: some View {
    VStack(spacing: constants.shoeSelectorVerticalSpacing) {
      Text(texts.alsoLikedBy)
        .font(.monserrat(weight: .semiBold, .size16))
        .foregroundColor(.fontRed)

      CircularImageCarouselView(
        systemImageNames: $presenter.users,
        action: { userId in
          router.navigate(to: .otherUserProfile(userId))
        }
      )
        .frame(height: constants.usersCarouselHeight)
       // .background(Color.red) Color test for carousel of users

      ShoeSlideView(currentSelection: $presenter.currentSelection,
                    shoes: $presenter.shoeProducts)
      //.background(Color.green) Color test for carousel of big circle

      AnglesComponentView(images: $presenter.shoeProducts[presenter.currentSelection].product.images)
        .offset(y: constants.anglesComponentOffset)
      //  .background(Color.yellow) background color mini tennis
    }
    //.background(Color.green) background color for big component
  }

  private var mainButtonView: some View {
    HStack {
      Spacer()
      Button(action: {
//          UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.userID.rawValue)
//          router2.navigateToRoot()
//          router2.tabView = false
          presenter.fetchLikes()
          
      }, label: {
          VStack {
              CircularImageView(imageName: presenter.likesFromUser[presenter.currentSelection]  ? "icono_like_relleno" : "icono_like",
                                        size: constants.mainButtonsSize,
                                        addBorder: false)
              Text("Like")
                  .font(Font.monserrat(weight: .regular, .size14))
                  .foregroundStyle(Color.fontGray)
          }
         // .background(Color.black)

      })
      .buttonStyle(.plain)
      //.background(Color.red) test color for bottom
      Spacer()
      Button(action: {
          router.navigate(to: .matchView(presenter.productId))
      }, label: {
          VStack {
              CircularImageView(imageName: "icono_match_circular",
                                size: constants.mainButtonsSize,
                                addBorder: false)
              Text("Match")
                  .font(Font.monserrat(weight: .regular, .size14))
                  .foregroundStyle(Color.fontGray)
          }
      })
      .buttonStyle(.plain)
      Spacer()
    }
    .frame(height: 64)
    //.background(Color.blue) color test of complete component background
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
  var filtersTopPadding: CGFloat { 8 }
  var filtersBottomPadding: CGFloat { 30 }
  var selectionIconsWidth: CGFloat { 106 }
    var shoeSelectorVerticalSpacing: CGFloat { 0 } //8 }
  var alsoLikedTitleBottonPadding: CGFloat { 4 }
  var shoeSelectorHeight: CGFloat { 500 }
  var anglesComponentOffset: CGFloat { -35 }
  var usersCarouselHeight: CGFloat { 60 }
  var mainButtonsSize: CGFloat { 50 }
}
