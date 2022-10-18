//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Albert Jordan on 7/14/22.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    
    static let emojis = ["🚘","🚖","🛵","🚂","🚲","✈️","🚌","🚑","🚀","🚁","🚠","🛻","⛵️","🏍","🚒","🚓","🚎","🚠"]
        
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(pairOfIndexCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var  cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK -  Intents
    
    func choose(_ card: MemoryGame<String>.Card) {
        objectWillChange.send()
        model.choose(card)
    }
    
}
