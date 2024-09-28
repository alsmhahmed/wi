//
//  MemorizeGame.swift
//  w1
//
//  Created by alsmh ahmed on 29/09/2024.
//

import Foundation


struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}
