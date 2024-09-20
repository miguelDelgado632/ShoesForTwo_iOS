//
//  RegisterView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI

struct RegisterView: View {

    @EnvironmentObject var router: Router

    var body: some View {
        VStack {
           TabBarCustom()
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterView()
}
