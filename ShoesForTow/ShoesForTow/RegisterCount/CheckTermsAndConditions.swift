//
//  CheckTermsAndConditions.swift
//  ShoesForTow
//
//  Created by Miguel angel Delgado Alcantara on 21/09/24.
//

import SwiftUI
import WebKit

struct CheckTermsAndConditions: View {

    @EnvironmentObject var router: Router
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
                router.navigate(to: .termsConditions)
            } label: {
                Text("Términos y condiciones")
                    .font(.monserrat(weight: .light, .size14))
                    .underline()
                    .foregroundStyle(Color.fontGray)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.top, 30)
    }
}


struct LinkWebView: UIViewRepresentable {

  let webView: WKWebView

  init() {
    self.webView = WKWebView()
  }

  init(url: String) {
    self.webView = WKWebView()
    loadURL(urlString: url)
  }

  func makeUIView(context: Context) -> WKWebView {
    webView.allowsBackForwardNavigationGestures = true
    return webView
  }

  func updateUIView(_ uiView: WKWebView, context: Context) {

  }

  func goBack(){
    webView.goBack()
  }

  func goForward(){
    webView.goForward()
  }


  func loadURL(urlString: String) {
    webView.load(URLRequest(url: URL(string: urlString)!))
  }
}
