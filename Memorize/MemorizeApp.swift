//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Amid Mamedov on 04.01.2026.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
