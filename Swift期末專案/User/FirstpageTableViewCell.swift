//
//  FirstpageTableViewCell.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/20.
//

import UIKit

class FirstpageTableViewCell: UITableViewCell {
    @IBOutlet weak var carID: UILabel!
    @IBOutlet weak var carDistance: UILabel!
    @IBOutlet weak var batteryValue: UILabel!
    @IBOutlet weak var carAvailableDistance: UILabel!
    @IBOutlet weak var goToMap: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
