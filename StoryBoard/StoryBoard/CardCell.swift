//
//  CardCell.swift
//  StoryBoard
//
//  Created by silvarlei soares on 15/03/22.
//

import Foundation
import UIKit

class CardCell:UICollectionViewCell{
    
    @IBOutlet weak var TopSuitLabel: UILabel!
    @IBOutlet weak var TopValueLabel: UILabel!
    
    @IBOutlet weak var Figure: UILabel!
    
    
    
    @IBOutlet weak var BottomSuitLabel: UILabel!
    @IBOutlet weak var BotomValueLabel: UILabel!
    
    
    func Draw(card: Card){
        
        let vermelho:Bool = (card.suit == .hearts || card.suit == .spades)
        if vermelho{
            TopValueLabel.textColor = .systemRed
            TopSuitLabel.textColor = .systemRed
            BotomValueLabel.textColor = .systemRed
            BottomSuitLabel.textColor = .systemRed
        }else{
            TopValueLabel.textColor = .systemBrown
            TopSuitLabel.textColor = .systemBrown
            BotomValueLabel.textColor = .systemBrown
            BottomSuitLabel.textColor = .systemBrown
        }
        TopValueLabel.text = card.getlabel()
        TopSuitLabel.text = card.getSymbol()
        
        BotomValueLabel.text = card.getlabel()
        BottomSuitLabel.text = card.getSymbol()
        
    }
}
