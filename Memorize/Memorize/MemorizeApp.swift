//
//  MemorizeApp.swift
//  Memorize
//
//  Created by silvarlei soares on 11/03/22.
//

import SwiftUI

@main
struct MemorizeApp: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            EmojiMemoryGameView(viewModel:game)
            //ContentView()
        }
    }
}
