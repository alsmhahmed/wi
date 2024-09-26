//
//  ContentView.swift
//  w1
//
//  Created by alsmh ahmed on 01/09/2024.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["👻","🎃","🕷️","😈","👽","🤡","🤠","👨🏻‍🚀","🌝"]
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack{
            cards
            cardCountAdjusters
        }
        .padding()
    }
    
    var cards: some View {
        HStack{
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundStyle(.orange)
    }
    
    var cardCountAdjusters: some View {
        HStack{
            cardAdder
            Spacer()
            cardRemover
        }
        .imageScale(.large)
        .font(.title3)
        .padding(.horizontal, 4)
    }
    
    
    var cardRemover: some View {
        Button(action: {
            if cardCount > 1 {
                cardCount -= 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    var cardAdder: some View {
        Button(action: {
            if cardCount < emojis.count {
                cardCount += 1
            }
        }, label: {
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
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
}

#Preview {
    ContentView()
}
