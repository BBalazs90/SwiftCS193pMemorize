//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Balazs on 10/04/2024.
//

import Foundation

struct MemorizeGame<CardContent: Hashable> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCard: Int, cardContentFactory: (Int)->CardContent) {
        cards = []
        for index in 0..<numberOfPairsOfCard {
            cards.append(Card(content: cardContentFactory(index), pairId: .first))
            cards.append(Card(content: cardContentFactory(index), pairId: .second))
        }
    }
    
    func choose(_ card: Card){
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    struct Card : Hashable {
        var isFaceUp = true
        var isMatch = false
        let content: CardContent
        fileprivate let pairId: PairId
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(content)
            hasher.combine(pairId)
        }
        
        fileprivate enum PairId {
            case first
            case second
        }
    }
}
