//
//  PerfilOtherUserView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 28/09/24.
//

import SwiftUI

struct PerfilOtherUserView: View {
    
    @ObservedObject var presenter: PerfilOtherUserPresenter = .init()
    @EnvironmentObject var router: Router
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    PerfilOtherUserView()
}
