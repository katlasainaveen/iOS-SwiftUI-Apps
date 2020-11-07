//
//  ContentView.swift
//  Dicee - SwiftUI
//
//  Created by Sai Naveen Katla on 11/09/20.
//  Copyright © 2020 Sai Naveen Katla. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftNumber = 1
    @State var rightNumber = 1
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    Image("dice\(leftNumber)")
                        .padding()
                    Image("dice\(rightNumber)")
                        .padding()
                }
                
                Spacer()
                Button(action: {
                    self.leftNumber = Int.random(in: 1...6)
                    self.rightNumber = Int.random(in: 1...6)
                }) {
                    Text("Roll")
                        .font(.system(size: 40))
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                }
                .background(Color.red)
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
