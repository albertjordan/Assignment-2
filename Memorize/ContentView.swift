//
//  ContentView.swift
//  Memorize
//
//  Created by Albert Jordan on 6/26/22.
//

import SwiftUI



struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
                
        
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:65))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit).onTapGesture(count: 1) {
                        viewModel.choose(card)
                    }
                    
                }
            }
        .padding(.horizontal)
        .foregroundColor(.red)
        }
        
    }
        


}


struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            }
            else {
                shape.fill()
            }
        }
    }
        
}
        

    








struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
    
}
