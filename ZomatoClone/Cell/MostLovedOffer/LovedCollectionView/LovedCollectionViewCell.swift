//
//  LovedCollectionViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 29/06/22.
//

import UIKit

class LovedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var offerView: UIView!
    @IBOutlet weak var offerTextLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        offerTextLabel.text = "deals \nfor one"
        DispatchQueue.main.async {
            self.offerView.layer.cornerRadius = 8
        }
    }

}
