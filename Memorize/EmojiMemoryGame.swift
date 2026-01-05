//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Amid Mamedov on 04.01.2026.
//

import SwiftUI
import Combine

final class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻", "😈", "😎", "👽", "👹", "💀", "🎃", "🤡", "🕷️", "💩", "🤖", "🧟"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: 16) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

