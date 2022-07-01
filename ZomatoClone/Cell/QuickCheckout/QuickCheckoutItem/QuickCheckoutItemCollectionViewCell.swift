//
//  QuickCheckoutItemCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class QuickCheckoutItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.starImageView.clipsToBounds = true
            self.starImageView.layer.cornerRadius = 5
            self.starImageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            self.ratingLabel.clipsToBounds = true
            self.ratingLabel.layer.cornerRadius = 5
            self.ratingLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
//        cellView.layer.borderWidth = 0.5
//        cellView.layer.borderColor = UIColor.gray.cgColor
//        cellView.layer.cornerRadius = 5
//        cellView.layer.shadowRadius = 5
//        cellView.layer.shadowColor = UIColor.gray.cgColor
//        cellView.layer.shadowOpacity = 0.7
//        cellView.layer.shadowOffset = CGSize(width: 0, height: 5)
    }

}
