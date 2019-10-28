//
//  homeImagesTableTableViewCell.swift
//  tableViewWhitImages
//
//  Created by Raul Armas Santiago on 10/9/19.
//  Copyright © 2019 Sento40. All rights reserved.
//

import UIKit

class homeImagesTableTableViewCell: UITableViewCell {

    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var labelTextOutlet: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
