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
                .font(.poppins(weight: .light, .size16))
                .foregroundStyle(Color.fontGray)
                .border(Color.fontGray)
                .textFieldStyle(.roundedBorder)
                .frame(width: 335, height: 35)
        }
    }
}

#Preview {
    TextFieldCustom(nameTextField: "Usuario", text: .constant("usuario.miguel"))
}
