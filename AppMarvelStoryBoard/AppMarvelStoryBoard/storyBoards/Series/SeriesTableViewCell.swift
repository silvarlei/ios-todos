//
//  SeriesTableViewCell.swift
//  AppMarvelStoryBoard
//
//  Created by silvarlei soares on 12/04/22.
//

import UIKit

class SeriesTableViewCell: UITableViewCell {

    @IBOutlet weak var imgSeries: UIImageView!
    @IBOutlet weak var lblTitulo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
