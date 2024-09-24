//
//  ShowGenderRegister.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/09/24.
//

import SwiftUI

struct ShowGenderRegister: View {
    @Binding var genders: [String]
    @State private var allSelectedGenders = Set<String>()
    @Binding var selectedGender: String
    
    var body: some View {
        HStack(spacing: 40) {
            ForEach(genders, id: \.self) { gender in
                Button {
                    if allSelectedGenders.contains(gender) {
                        allSelectedGenders.remove(gender)
                    } else {
                        allSelectedGenders.removeAll()
                        allSelectedGenders.insert(gender)
                    }
                    selectedGender = gender
                } label: {
                    HStack {
                        Rectangle()
                            .frame(width: 10, height: 10)
                            .border(Color.fontGray)
                            .foregroundStyle(allSelectedGenders.contains(gender) ? Color.fontGray : Color.white)
                            
                        Text(gender)
                            .font(.poppins(weight: .light, .size14))
                            .foregroundStyle(Color.fontGray)
                    }
                }
            }
            Spacer()
        }
        .frame(alignment: .leading)
    }
}

