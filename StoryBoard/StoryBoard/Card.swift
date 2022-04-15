//
//  Card.swift
//  StoryBoard
//
//  Created by silvarlei soares on 15/03/22.
//

import Foundation

class Card
{
    var value :Int
    var suit: CardSuit
    
    init(value:Int,suit:CardSuit )
    {
        self.value = value
        self.suit = suit
    }
    
    init()
    {
        let suits:[CardSuit]=[.clubs ,.diamonts,.hearts,.spades]
        self.value = Int.random(in:1..<13)
        self.suit = suits[Int.random(in: 0..<suits.count)]
    }
    
    func getSymbol()->String{
        switch suit{
        case .clubs:
            return "♣"
        case .diamonts:
            return "♦"
        case .hearts:
            return "♥"
        default:
            return "♠"
        }
    }
    
    func getlabel()->String{
        switch value {
        case 1:
            return "A"
        case 11:
            return "J"
        case 12:
            return "Q"
        case 13:
            return"K"
        default:
            return "\(self.value)"
        }
    }
    
    
    static func ==(lhs:Card,rhs:Card)-> Bool{
        return (lhs.value == rhs.value && lhs.suit == rhs.suit)
    }
}

enum CardSuit{
    case clubs, diamonts , hearts,spades
}
