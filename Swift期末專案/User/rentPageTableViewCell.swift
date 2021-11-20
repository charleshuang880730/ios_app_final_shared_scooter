//
//  rentPageTableViewCell.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/22.
//

import UIKit

class rentPageTableViewCell: UITableViewCell {
    @IBOutlet weak var batteryValue: UILabel!
    @IBOutlet weak var distanceValue: UILabel!
    @IBOutlet weak var rentButton: UIButton!
    @IBOutlet weak var carId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
