//
//  InvitationsView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI

struct InvitationsView: View {

  @ObservedObject var presenter: InvitationsPresenter = .init()
  @EnvironmentObject var router: ProfileRouter
  var body: some View {
    GeometryReader { geometry in
      ScrollView {
        VStack {
          TabBarCustom(title: "Invitaciones", customRouter: router)

          ForEach(0...5, id: \.self) { _ in
            HStack(spacing: 23) {
              InvitationsCard(componentSize: geometry.size.width * 0.25)
              VStack(spacing: 5) {
                Text("Rogelio Cruz")
                  .font(.monserrat(weight: .semiBold, .size14))
                  .frame(maxWidth: .infinity, alignment: .leading)
                Text("Converse 1")
                  .font(.monserrat(weight: .regular, .size14))
                  .frame(maxWidth: .infinity, alignment: .leading)
                PrimaryButton(action: {

                },
                              title: "Completar compra",
                              width: 123,
                              height: 20,
                              font: .monserrat(weight: .regular, .size12))
              }
              Spacer()
            }
            .frame(maxWidth: . infinity)
            .padding(.horizontal, 20)
            .padding(.top, 20)
          }
        }
        .navigationBarBackButtonHidden()
      }
    }
  }
}

#Preview {
  InvitationsView()
}

struct InvitationsCard: View {

  let componentSize: CGFloat

  var body: some View {
    HStack(alignment: .center, spacing: -25) {
      ShoeDetailView(image: .leftShoeTest,
                     backgroundColor: .fontRed,
                     componentSize: componentSize,
                     backgroundOpacity: 0.15)

      ShoeDetailView(image: .rightShoeTest,
                     backgroundColor: .fontPurple,
                     componentSize: componentSize,
                     backgroundOpacity: 0.15)
    }
  }
}
