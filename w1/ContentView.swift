//
//  ContentView.swift
//  w1
//
//  Created by alsmh ahmed on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            CardView(isFaceUp: true)
            CardView(isFaceUp: true)
            CardView()
            CardView()
        }
        .padding()
        .foregroundStyle(.orange)
    }
}


struct CardView: View {
    var isFaceUp: Bool = false
    
    var body: some View {
            ZStack(content: {
                if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.white)
                
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("👻").font(.largeTitle)
                } else {
                    RoundedRectangle(cornerRadius: 12)
                }
        })
            
        }
    }

#Preview {
    ContentView()
}
