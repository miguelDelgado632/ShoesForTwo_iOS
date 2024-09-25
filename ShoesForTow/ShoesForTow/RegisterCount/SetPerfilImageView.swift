//
//  SetPerfilImageView.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/09/24.
//

import SwiftUI
import PhotosUI

struct SetPerfilImageView: View {
    
    @State private var isPresented:Bool = false
    @State private var sourceType: Bool = false
    @Binding var selectedImage: UIImage?
    
    var body: some View {
        Button {
            isPresented.toggle()
        } label: {
            HStack {
                if selectedImage != nil {
                    Image(uiImage: selectedImage!)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                } else {
                    Image("icono_photo_perfil")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                }
                Text("Subir Foto")
                    .font(.monserrat(weight: .light, .size14))
                    .foregroundStyle(Color.fontGray)
            }
            
        }
        .sheet(isPresented: $isPresented){
            ShowSheetCamAndLibrary(sourceType: $sourceType, selectedImage: $selectedImage)
                .presentationDetents([.medium,.large])
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 30)
    }
}

struct ShowSheetCamAndLibrary: View {
    
    // Picker Variable
    //@State private var sourceType: Bool = false //SourceTypePikcer = .camera
    @Binding var sourceType: Bool
    @Binding var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var pickerConfig: PHPickerConfiguration {
        var config = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        config.filter = .images
        config.selectionLimit = 1
        config.preferredAssetRepresentationMode = .current
        return config
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Camera") {
                self.sourceType = true//.camera
                self.isImagePickerDisplay.toggle()
            }
            .font(.monserrat(weight: .extraBold, .size14))
            .padding()
            
            Button("photo") {
                self.sourceType = false//.library
                self.isImagePickerDisplay.toggle()
            }
            .font(.monserrat(weight: .extraBold, .size14))
            .padding()
        }
        .navigationBarTitle("Demo")
        .sheet(isPresented: self.$isImagePickerDisplay) {
            if sourceType {
                ImagePickerView(selectedImage: self.$selectedImage, sourceType: .camera)
                    .ignoresSafeArea()
            } else {
                PHPickerSwiftUI(config: pickerConfig, selectedImage: self.$selectedImage)
                    .ignoresSafeArea()
            }
        }
        
    }
}
