//
//  MoneyTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 30/06/22.
//

import UIKit

class MoneyTableViewCell: UITableViewCell {

    @IBOutlet weak var moneySubHeadLineLabel: UILabel!
    @IBOutlet weak var moneyHeadLineLabel: UILabel!
    @IBOutlet weak var moneyImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.moneyImageView.layer.borderWidth = 0.5
        self.moneyImageView.layer.borderColor = UIColor.gray.cgColor
        DispatchQueue.main.async {
            self.moneyImageView.layer.cornerRadius = self.moneyImageView.frame.size.width/2
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
