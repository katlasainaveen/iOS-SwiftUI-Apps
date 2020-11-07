//
//  DetailedView.swift
//  H4XNews - SwiftUI
//
//  Created by Sai Naveen Katla on 11/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import SwiftUI
import WebKit

struct DetailedView: View {
    
    let url: String?
    
    var body: some View {
        WebView(urlstring: url)
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView(url: "https://www.google.com")
    }
}

struct WebView: UIViewRepresentable {
    
    let urlstring: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safestring = urlstring {
            if let url = URL(string: safestring) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
        else {
            print("no url")
        }
    }
    
}
