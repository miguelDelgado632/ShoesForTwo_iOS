//
//  CheckTermsAndConditions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/09/24.
//

import SwiftUI

struct CheckTermsAndConditions: View {

    @Binding var checkTermisAndConditios: Bool
    
    var body: some View {
        HStack {
            Button {
                checkTermisAndConditios.toggle()
            } label: {
                Rectangle()
                    .frame(width: 10, height: 10)
                    .border(Color.fontGray)
                    .foregroundStyle(checkTermisAndConditios ? Color.fontGray : Color.white)
            }
            Button {
                
            } label: {
                Text("Terminos y Condiciones")
                    .font(.poppins(weight: .light, .size14))
                    .underline()
                    .foregroundStyle(Color.fontGray)
            }
            Spacer()
        }
        .frame(width: 335, alignment: .leading)
        .padding(.top, 30)
    }
}