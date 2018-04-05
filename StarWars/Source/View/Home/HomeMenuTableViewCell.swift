//
//  HomeMenuTableViewCell.swift
//  StarWars
//
//  Created by Diego Francisco Lechado on 27/03/18.
//  Copyright © 2018 ciandt. All rights reserved.
//

import UIKit

class HomeMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(menuItem: MenuItem){
        titleLabel.text = menuItem.title
        backgroundImage.image = UIImage(named: menuItem.imageName!)
    }

}
