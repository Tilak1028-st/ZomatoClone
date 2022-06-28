//
//  SmallProductCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class SmallProductCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var ratingButton: UIButton!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var deliveryTimelabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var smallProductImage: UIImageView!
    
    var smallProductArray : Product? {
        didSet {
            self.smallProductImage.image = smallProductArray?.productImage
            self.discountLabel.text = "\(smallProductArray?.discountOffer ?? 0)% OFF UPTO Rs.100"
            self.productNameLabel.text = smallProductArray?.productName
            self.deliveryTimelabel.text = "\(smallProductArray?.reachTime ?? 0) Mins"
            self.priceLabel.text = "\(smallProductArray?.productPrice ?? "")"
            self.ratingButton.setTitle(smallProductArray?.rating, for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
