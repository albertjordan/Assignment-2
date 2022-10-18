//
//  MemoryGame.swift
//  Memorize
//
//  Created by Albert Jordan on 7/14/22.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    private(set) var cards: [Card]
    
    private var indexForOneAndOnlyFaceUpCard: Int?
    
    init (pairOfIndexCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<pairOfIndexCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2 + 1 ))
         }
        cards.shuffle()
    }
    
    mutating func choose(_ card: Card) {
        print("\(cards)")
        
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}),
                        !cards[chosenIndex].isFaceUp,
                        !cards[chosenIndex].isMatched
                    
        {
            if let potentialMatch = indexForOneAndOnlyFaceUpCard {
                if cards[potentialMatch].content == cards[chosenIndex].content {
                    cards[potentialMatch].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                indexForOneAndOnlyFaceUpCard = nil
            } else {
                for index in cards.indices{
                    cards[index].isFaceUp = false
                }
                
                indexForOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp.toggle()

            
        }
        
     }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
