//
//  MostLovedTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 29/06/22.
//

import UIKit

class MostLovedTableViewCell: UITableViewCell {

    @IBOutlet weak var lovedCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.registerCollectionViewCell(collectionView: lovedCollectionView, cellName: StringConstant.lovedCollectionViewCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension MostLovedTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = lovedCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.lovedCollectionViewCell, for: indexPath) as! LovedCollectionViewCell
        if indexPath.item == 1
        {
            item.offerTextLabel.text = "unlimited \nflat deals"
        }
        else if indexPath.item == 2
        {
            item.offerTextLabel.text = "fastest \ndeliveries"
        }
        return item
    }
}

extension MostLovedTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/2.5, height: collectionHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 10
    }
}
