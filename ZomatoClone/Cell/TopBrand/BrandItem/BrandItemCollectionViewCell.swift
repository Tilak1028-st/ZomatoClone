//
//  BrandItemCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class BrandItemCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timmerView: UIView!
    @IBOutlet weak var timerImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var brandNameLabel: UILabel!
    @IBOutlet weak var brandImageView: UIImageView!
    
     var imageWidth: CGFloat?
    
    var brandArray: TopBrand?
    {
        didSet
        {
            self.brandImageView.image = brandArray?.brandImage
            self.brandNameLabel.text = brandArray?.brandName
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.brandImageView.layer.borderWidth = 0.5
        self.brandImageView.layer.borderColor = UIColor.gray.cgColor
        DispatchQueue.main.async {
            self.brandImageView.layer.cornerRadius = self.brandImageView.frame.size.width/self.imageWidth!
        }
    }
}
