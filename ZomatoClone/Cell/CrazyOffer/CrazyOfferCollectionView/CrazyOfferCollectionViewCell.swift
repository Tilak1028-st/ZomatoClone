//
//  CrazyOfferCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 29/06/22.
//

import UIKit

class CrazyOfferCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productImageView.layer.borderWidth = 0.5
        self.productImageView.layer.borderColor = UIColor.gray.cgColor
        DispatchQueue.main.async {
            self.productImageView.layer.cornerRadius = self.productImageView.frame.size.width/8
        }
    }

}
