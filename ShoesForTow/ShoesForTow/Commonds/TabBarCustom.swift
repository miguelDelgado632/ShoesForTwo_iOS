//
//  TabBarCustom.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI

struct TabBarCustom: View {

    @EnvironmentObject var router: Router
    var title: String

    var body: some View {
        HStack {
            Button {
                router.navigateBack()
            } label: {
                Image(systemName: "chevron.backward")
                    .resizable()
                    .frame(width: 15, height: 25)
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(Color.fontGray)
            }
            Spacer()
            Text(title)
                .font(.monserrat(weight: .extraBold, .size16))
                .foregroundStyle(Color.fontRed)
            Spacer()
            Rectangle()
                .frame(width: 20, height: 20)
                .foregroundStyle(Color.white)
            
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
}

#Preview {
    TabBarCustom(title: "test")
}
