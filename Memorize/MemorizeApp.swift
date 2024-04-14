//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Balazs on 07/04/2024.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var emojiGame = EmojiMemorizeGame()
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(vm: emojiGame)
        }
    }
}
