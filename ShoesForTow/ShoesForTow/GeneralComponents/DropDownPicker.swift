//
//  DropDownPicker.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 20/09/24.
//

import SwiftUI

struct DropDownPicker: View {
    
    @Binding var selection: String?
    var state: DropDownPickerState = .bottom
    var options: [String]
    var maxWidth: CGFloat = 335
    
    @State var showDropdown = false
    
    @SceneStorage("drop_down_zindex") private var index = 1000.0
    @State var zindex = 1000.0
    @State private var tapButton: Bool = false
    
    var body: some View {
        GeometryReader {
            let _ = $0.size
            
            VStack(spacing: 0) {
                ScrollView {
                
                if state == .top && showDropdown {
                    OptionsView()
                }
                
                HStack {
                    Text(selection == nil ? "Talla de calzado" : selection!)
                        .font(.monserrat(weight: .light, .size16))
                        .foregroundColor(Color.fontGray)
                    
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: state == .top ? "chevron.up" : "chevron.down")
                        .font(.monserrat(weight: .light, .size16))
                        .foregroundColor(Color.fontGray)
                        .rotationEffect(.degrees((showDropdown ? -180 : 0)))
                }
                .padding(.horizontal, 15)
                .frame(width: maxWidth, height: 35)
                .foregroundStyle(Color.fontGray)
                .background(Color.backColor)
                .contentShape(.rect)
                .onTapGesture {
                    index += 1
                    zindex = index
                    tapButton.toggle()
                    withAnimation(.snappy) {
                        showDropdown.toggle()
                    }
                }
                .zIndex(10)
                
                if state == .bottom && showDropdown {
                    OptionsView()
                }
            }
                .frame(height: tapButton ? 100 : 40, alignment: state == .top ? .bottom : .top)
            }
            .clipped()
            .background(Color.backColor)
            .overlay {
                RoundedRectangle(cornerRadius: 0)
                    .stroke(Color.white)
                    .border(Color.fontGray, width: 0.7)
            }
            .frame(height:  tapButton ? 100 : 40, alignment: state == .top ? .bottom : .top)
            //.frame(height: size.height, alignment: state == .top ? .bottom : .top)
            
        }
        .frame(width: maxWidth, height: 35)
        .zIndex(zindex)
    }
    func OptionsView() -> some View {
            VStack(spacing: 0) {
                ForEach(options, id: \.self) { option in
                    HStack {
                        Text(option)
                            .font(.monserrat(weight: .light, .size16))
                            .foregroundStyle(Color.fontGray)
                        Spacer()
                        Image(systemName: "checkmark")
                            .opacity(selection == option ? 1 : 0)
                    }
                    .animation(.none, value: selection)
                    .frame(height: 35)
                    //.contentShape(.rect)
                    .padding(.horizontal, 15)
                    .onTapGesture {
                        tapButton = false
                        withAnimation(.snappy) {
                            selection = option
                            showDropdown.toggle()
                        }
                    }
                }
            }
            .transition(.move(edge: state == .top ? .bottom : .top))
            .zIndex(1)
        }
    }

#Preview {
    DropDownPicker(selection: .constant("selectes"), options: ["25","25.5","26","26.5","27","27.5","28","28.5","29","29.5","30"])
}


enum DropDownPickerState {
    case top
    case bottom
}
