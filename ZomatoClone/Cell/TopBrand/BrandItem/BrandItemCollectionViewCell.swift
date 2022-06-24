//
//  BrandItemCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class BrandItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.brandImageView.layer.borderWidth = 0.5
        self.brandImageView.layer.borderColor = UIColor.gray.cgColor
        self.brandImageView.layer.cornerRadius = self.brandImageView.frame.size.width/2
    }

}
