//
//  QuickCheckoutItemCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class QuickCheckoutItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.cellView.layer.borderWidth = 1
        self.cellView.layer.borderColor = UIColor.gray.cgColor
        self.cellView.layer.cornerRadius = 10
    }

}
