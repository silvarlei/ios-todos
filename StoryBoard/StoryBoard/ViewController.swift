//
//  ViewController.swift
//  StoryBoard
//
//  Created by silvarlei soares on 15/03/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var deck: UICollectionView!
    
    var cards:[Card] = []
    var selectCard:Card = Card()
    override func viewDidLoad() {
        super.viewDidLoad()
        deck.dataSource = self
        deck.delegate = self
        // Do any additional setup after loading the view.
        let suits:[CardSuit] = [.clubs,.hearts,.spades,.diamonts]
        for suit in suits{
            for value in 1...13{
                let card = Card(value:value ,suit: suit)
                cards.append(card)
            }
        }
    }
}

extension ViewController :UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell:CardCell = deck.dequeueReusableCell(withReuseIdentifier: "DeckId", for: indexPath) as! CardCell
        
        cell.Draw(card: Card())
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectCard = cards[indexPath.item]
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc:DetailViewController = segue.destination as! DetailViewController
        vc.userCard = selectCard
    }
}
