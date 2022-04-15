//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by silvarlei soares on 12/03/22.
//

import SwiftUI



class EmojiMemoryGame:ObservableObject{
    
    //mesmo codigo de baixo so que com bem mais detalhes
    //    private var model:MemoryGame<String> =
    //    MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory:  { (pairIndex :Int)->String in
    //        return"😇"
    //    })
    
    @Published private var model:MemoryGame<String>=EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame()-> MemoryGame<String>{
        
        let emojis :Array<String>=["💀","🎃" , "👾"]
        return MemoryGame<String>(numberOfPairsOfCards:emojis.count)   { pairIndex in
            return emojis[pairIndex]
            
        }
    }
    
//var objectWillChanger: ObservableObjectPubliser
    
    var cards:Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    
    func choose(card:MemoryGame<String>.Card){
        //objectWillChanger.send()
        model.choose(card: card)
    }
}
