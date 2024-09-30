//
//  MyOrderView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI

struct MyOrderView: View {
    
    @ObservedObject var presenter: MyOrderPresenter = .init()
    @EnvironmentObject var router: ProfileRouter
    
    var body: some View {
        ScrollView {
            VStack {
                TabBarCustom(title: "Mis pedidos", customRouter: router)
                VStack(spacing: 20) {
                    ForEach(Array(presenter.dataString.enumerated()), id: \.element) { index, name in
                        Button {
                            router.navigate(to: .seeOrderStatus(name, .MyOrders))
                        } label: {
                            CardMyOrder(name: name,
                                        status: presenter.statusOrder[index])
                        }
                    }
                }
                .padding([.horizontal, .top], 40)
                Spacer()
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    MyOrderView()
}

struct CardMyOrder: View {

    var name: String
    var status: String

    var body: some View {
        HStack(spacing: 30) {
            ShoeDetailView(image: .leftShoeTest, backgroundColor: .fontRed, componentSize: 125, backgroundOpacity: 0.15)
            VStack(spacing: 10) {
                Text(name)
                    .font(.monserrat(weight: .regular, .size14))
                    .foregroundStyle(Color.fontGray)
                    .frame(maxWidth: .infinity ,alignment: .leading)
                Text(status)
                    .font(.monserrat(weight: .bold, .size16))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.fontGray)
                    .frame(maxWidth: .infinity ,alignment: .leading)
            }
        }
    }
}
