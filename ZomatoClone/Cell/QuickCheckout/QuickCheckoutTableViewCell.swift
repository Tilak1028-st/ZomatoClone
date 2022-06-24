//
//  QuickCheckoutTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class QuickCheckoutTableViewCell: UITableViewCell {
    
    @IBOutlet weak var quickCheckoutCollectionVew: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        quickCheckoutCollectionVew.register(UINib(nibName: StringConstant.quickCheckoutCollectViewCell, bundle: nil), forCellWithReuseIdentifier: StringConstant.quickCheckoutCollectViewCell)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

extension QuickCheckoutTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = quickCheckoutCollectionVew.dequeueReusableCell(withReuseIdentifier: StringConstant.quickCheckoutCollectViewCell, for: indexPath) as! QuickCheckoutItemCollectionViewCell
        return item
    }
}

extension QuickCheckoutTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        return CGSize(width: collectionWidth/1.5, height: collectionHeight)
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
