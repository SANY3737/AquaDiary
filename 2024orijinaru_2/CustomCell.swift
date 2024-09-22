//
//  CustomCell.swift
//  2024orijinaru_2
//
//  Created by HIDAKA SANA on 2024/07/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var tableviewimage: UIImageView!
    @IBOutlet weak var tableviewlabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
