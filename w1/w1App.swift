//
//  w1App.swift
//  w1
//
//  Created by alsmh ahmed on 01/09/2024.
//

import SwiftUI

@main
struct w1App: App {
    @StateObject var game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
