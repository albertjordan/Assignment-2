//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Albert Jordan on 6/26/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
