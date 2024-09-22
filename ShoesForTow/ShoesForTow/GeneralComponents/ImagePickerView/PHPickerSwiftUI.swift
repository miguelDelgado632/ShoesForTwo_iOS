//
//  PHPickerSwiftUI.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/09/24.
//

import PhotosUI
import SwiftUI

var preselectedAssetIdentifiers = [String]()

struct PHPickerSwiftUI: UIViewControllerRepresentable {
   
    @Environment(\.presentationMode) var presentationMode
    let config: PHPickerConfiguration
    @Binding var selectedImage: UIImage?
    
    func makeUIViewController(context: Context) ->  PHPickerViewController {
        let controller = PHPickerViewController(configuration: config)
        controller.delegate = context.coordinator
        return controller
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {
        // We'll not update anything on this view.
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
        let parent: PHPickerSwiftUI
        
        init(parent: PHPickerSwiftUI) {
            self.parent = parent
        }

        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            preselectedAssetIdentifiers = results.map(\.assetIdentifier!)
            parent.presentationMode.wrappedValue.dismiss()
            for item in results {
                item.itemProvider.loadObject(ofClass: UIImage.self) {(image, error) in
                    guard let fileName = item.itemProvider.suggestedName else { return }
                                if let image = image as? UIImage{
                                    self.parent.selectedImage = image
                                }
                    
                }
            }
        }
    }
    
}
