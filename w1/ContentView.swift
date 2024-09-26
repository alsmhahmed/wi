//
//  ContentView.swift
//  w1
//
//  Created by alsmh ahmed on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","😈","😈"]
    var body: some View {
        HStack{
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundStyle(.orange)
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2.0)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
        
    }
}

#Preview {
    ContentView()
}
