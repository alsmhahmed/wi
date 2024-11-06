//
//  EmojiMemoryGameView.swift
//  w1
//
//  Created by alsmh ahmed on 01/09/2024.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame // this is bad way to declear the view model
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            .padding()
            
            Button("shuffle"){
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)],
                  spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3,contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundStyle(Color.orange)
    }
    
//    var cardCountAdjusters: some View {
//        HStack{
//            cardRemover
//            Spacer()
//            
//            cardAdder
//            
//        }
//        .imageScale(.large)
//        .font(.title3)
//        .padding(.horizontal, 4)
//    }
    
//    func cardCountAdjusters(by offset: Int, symbol: String ) -> some View {
//        Button(action: {
//            cardCount += offset
//            
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
    
    
    
//    var cardRemover: some View {
//        cardCountAdjusters(by: -1, symbol: "rectangle.stack.badge.minus.fill")
//    }
    
//    var cardAdder: some View {
//        cardCountAdjusters(by: +1, symbol: "rectangle.stack.badge.plus.fill")
//    }
    
    
    struct CardView: View {
        let card: MemoryGame<String>.Card
        
        init(_ card: MemoryGame<String>.Card) {
            self.card = card
        }
  
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                Group{
                    base.fill(.white)
                    base.strokeBorder(lineWidth: 2.0)
                    Text(card.content)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.1)
                        .aspectRatio(1, contentMode: .fit)
                }
                    .opacity(card.isFaceUp ? 1 : 0)
                base.fill()
                    .opacity(card.isFaceUp ? 0 : 1)
            }
            
        }
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
