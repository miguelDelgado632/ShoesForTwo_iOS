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
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            if presenter.isLoading {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .navigationBarBackButtonHidden()
                    .scaleEffect(1.5)
                    .padding()
            } else {
                ImageGridView(correctData: presenter.likes)
                    .alert("Alerta", isPresented: $presenter.showError) {
                        Button("OK") {}
                    } message: {
                        Text(presenter.errorText)
                    }
            }
        }
    }
}

#Preview {
    FavoritesView()
}
