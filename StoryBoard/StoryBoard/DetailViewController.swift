//
//  DetailViewController.swift
//  StoryBoard
//
//  Created by silvarlei soares on 15/03/22.
//

import Foundation
import UIKit

class DetailViewController:UIViewController {
  
    @IBOutlet weak var Deck: UICollectionView!
    var cards:[Card] = []
    var userCard:Card = Card()
    
    override func viewDidLoad() {
        
        let myCard:Card = Card()
        cards.append(userCard)
        cards.append(myCard)
        
        Deck.dataSource = self
    }
  
}



extension DetailViewController :UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CardCell = Deck.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.Draw(card: cards[indexPath.item])
        return cell
    }
    
    
}
