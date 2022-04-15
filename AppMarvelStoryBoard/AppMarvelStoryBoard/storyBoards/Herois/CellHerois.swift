//
//  CellHerois.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 18/03/22.
//

import UIKit

class CellHerois: UITableViewCell {

    @IBOutlet weak var imgHerois: UIImageView!
    @IBOutlet weak var lblHeroi: UILabel!
    
    @IBOutlet weak var lblDescricao: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup(item: Result) {
        lblHeroi.text = item.name
       // imgHerois.download(image: item.thumbnail.path ?? "")
     }
}
