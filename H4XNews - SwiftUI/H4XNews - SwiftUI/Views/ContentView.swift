//
//  ContentView.swift
//  H4XNews - SwiftUI
//
//  Created by Sai Naveen Katla on 11/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = NetworkManager()
    
    var body: some View {
        NavigationView {
            VStack {
                List(manager.posts) { post in
                    NavigationLink(destination: DetailedView(url: post.url)) {
                        HStack {
                            Text("\(post.points)")
                                .padding(.trailing)
                            Text(post.title)
                        }
                    }
                }
            }
            
            .navigationBarTitle("H4X0R News")
        }
        .onAppear(perform: manager.fetchData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
