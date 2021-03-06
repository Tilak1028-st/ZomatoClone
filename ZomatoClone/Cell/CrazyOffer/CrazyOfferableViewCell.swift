//
//  CrazyOfferableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 29/06/22.
//

import UIKit

class CrazyOfferableViewCell: UITableViewCell {

    
    @IBOutlet weak var seeAllOfferButton: UIButton!
    @IBOutlet weak var offerLabel: UILabel!
    @IBOutlet weak var crazyOfferCollectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.registerCollectionViewCell(collectionView: crazyOfferCollectionView, cellName: StringConstant.crazyOfferCollectionViewCell)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}


extension CrazyOfferableViewCell : UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = crazyOfferCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.crazyOfferCollectionViewCell, for: indexPath) as! CrazyOfferCollectionViewCell
        return item
    }
}

extension CrazyOfferableViewCell: UICollectionViewDelegateFlowLayout
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
