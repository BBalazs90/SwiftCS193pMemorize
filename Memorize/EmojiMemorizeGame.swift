//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by Balazs on 10/04/2024.
//

import SwiftUI

class EmojiMemorizeGame : ObservableObject {
    @Published private var game = MemorizeGame(numberOfPairsOfCard: 16) {index in
        String(bytes: [0xF0,0x9F,0x98,0x81+UInt8(clamping: index)], encoding: .utf8) ?? "💩"
    }
    
    var cards: Array<MemorizeGame<String>.Card> { game.cards }
    
    func choose(_ card: MemorizeGame<String>.Card){
        game.choose(card)
    }
    
    func shuffle() {
        game.shuffle()
    }
}
