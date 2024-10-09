//
//  TextFieldCustom.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 19/09/24.
//

import SwiftUI

struct TextFieldCustom: View {
    
    var nameTextField: String
    @Binding var text: String

    var body: some View {
        VStack {
            TextField(nameTextField, text: $text)
                .padding(.leading, 10)
                .frame(height: 35)
                .font(.monserrat(weight: .light, .size16))
                .background(Color.backColor)
                .foregroundStyle(Color.fontGray)
                .border(Color.fontGray, width: 0.7)
        }
    }
}

#Preview {
    TextFieldCustom(nameTextField: "Usuario", text: .constant("usuario.miguel"))
}
