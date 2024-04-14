//
//  ContentView.swift
//  Memorize
//
//  Created by Balazs on 07/04/2024.
//

import SwiftUI

struct MemorizeGameView: View {
    @ObservedObject var vm: EmojiMemorizeGame
    
    var body: some View {
        VStack {
            ScrollView{
                cards
            }
            Button("Shuffle") {
                vm.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
                ForEach(vm.cards, id: \.self){
                    CardView($0)
                        .aspectRatio(2/3, contentMode: .fit)
                        .padding(4)
                }
            }
            .padding()
            .foregroundColor(.orange)
    }
    
    
}

struct CardView : View {
    
    init(_ card: MemorizeGame<String>.Card) {
        self.card = card
    }
    
    let card: MemorizeGame<String>.Card
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            
            base
                .fill()
                .opacity(card.isFaceUp ? 0 : 1)
            
        }
    }
}

#Preview {
    MemorizeGameView(vm: EmojiMemorizeGame())
}
