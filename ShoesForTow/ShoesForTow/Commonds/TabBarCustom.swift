//
//  TabBarCustom.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI

struct TabBarCustom: View {

  @EnvironmentObject var router: Router
  let title: String
  let showBack: Bool
  let titleFont: Font
  let customRouter: (any RouterProtocol)?

  init(title: String,
       showBack: Bool = true,
       titleFont: Font = .monserrat(weight: .semiBold, .size16),
       customRouter: (any RouterProtocol)? = nil) {
    self.title = title
    self.showBack = showBack
    self.titleFont = titleFont
    self.customRouter = customRouter
  }

    var body: some View {
        HStack {
            if showBack {
              Button {
                if let customRouter = customRouter {
                  customRouter.navigateBack()
                } else {
                  router.navigateBack()
                }
            } label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .fontWeight(.ultraLight)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.fontGray)
            }
        }
            Spacer()
            Text(title)
                .font(titleFont)
                .foregroundStyle(Color.fontRed)
            Spacer()
            Rectangle()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.backColor)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    TabBarCustom(title: "test")
}
