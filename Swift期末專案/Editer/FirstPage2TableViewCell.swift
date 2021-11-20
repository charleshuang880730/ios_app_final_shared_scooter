//
//  FirstPage2TableViewCell.swift
//  Swift期末專案
//
//  Created by 阿黃 on 2021/6/22.
//

import UIKit

class FirstPage2TableViewCell: UITableViewCell {
    @IBOutlet weak var carID: UILabel!
    @IBOutlet weak var batteryValue: UILabel!
    @IBOutlet weak var rateValue: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
