//
//  FilterCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        filterView.layer.borderWidth = 0.5
        filterView.layer.borderColor = UIColor.gray.cgColor
        filterView.layer.cornerRadius = 8
    }
}
