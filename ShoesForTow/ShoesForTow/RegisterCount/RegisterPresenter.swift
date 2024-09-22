//
//  RegisterPresenter.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 22/09/24.
//

import SwiftUI


final class RegisterPresenter: ObservableObject {

    @Published var name: String = ""
    @Published var apellido: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var selectedGender: String = ""
    @Published var shoesSize: String? = nil
    @Published var selectedImage: UIImage?
    @Published var checkTermisAndConditios: Bool = false

    
    init() {
        
    }
    
}
