//
//  MemoryGame.swift
//  Memorize
//
//  Created by silvarlei soares on 12/03/22.
//

import Foundation
import SwiftUI

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards:Array<Card>
    var indexOfTheOneAndOnlyFaceUpCard :Int?
    
    mutating func choose(card:Card){
        print ("Card chosen!\(card)")
        if let chosenIndex=cards.firstIndex(matching:card) , !cards[chosenIndex].isFaceUp ,!cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard
            {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfTheOneAndOnlyFaceUpCard = nil
            }else{
                for index in cards.indices
                {
                    cards[index].isFaceUp = false
                }
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            
            cards[chosenIndex].isFaceUp = true
        }
        
    }
    
    
    init(numberOfPairsOfCards:Int,cardContentFactory:(Int )-> CardContent)
    {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards
        {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(isFaceUp: false, isMatched: false, content: content,id: pairIndex*2))
            cards.append(Card(isFaceUp: false, isMatched: false, content: content,id: pairIndex*2+1))
        }
    }
    
    
    struct Card: Identifiable{
        var isFaceUp :Bool=false
        var isMatched:Bool
        var content:CardContent
        var id:Int
    }
}
