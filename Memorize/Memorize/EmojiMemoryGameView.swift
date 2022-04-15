//
//  ContentView.swift
//  Memorize
//
//  Created by silvarlei soares on 11/03/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel :EmojiMemoryGame
    
    var body: some View {
        
        
        
        //HStack(  content:{
        //ForEach(viewModel.cards, content:{ card in
        Grid(viewModel.cards ,viewForItem:
                {
            card in
            CardView(card:card).onTapGesture(perform: {
                viewModel.choose(card: card)
            })
                .padding(5)
            
        })
            .padding()
            .foregroundColor(Color.orange)
        
    }
}


struct CardView :View{
    var card:MemoryGame<String>.Card
    
    var body: some View{
        
        GeometryReader{  geometry in
            body(for: geometry.size)
        }
    }
    
    
    func body (for size:CGSize)-> some View{
        ZStack(content:{
            if card.isFaceUp
            {
                RoundedRectangle(cornerRadius: cornerRadios).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadios).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            }
            else
            {
                if !card.isMatched
                {
                    RoundedRectangle(cornerRadius: cornerRadios).fill()
                }
               
            }
        })
            .font(Font.system(size: fontSize(para: size)))
    }
    
    func fontSize(para size:CGSize)->CGFloat
    {
        min(size.width,size.height) * fontScalerFactor
    }
    
    let cornerRadios:CDouble = 10.0
    let edgeLineWidth:CDouble = 3
    let fontScalerFactor:CDouble = 0.75
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
