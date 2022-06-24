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
        Utility.registerCollectionViewCell(collectionView: quickCheckoutCollectionVew, cellName: StringConstant.quickCheckoutCollectViewCell)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

//MARK: - QuickCheckoutTableViewCell's CollectionView Delegate and Datasource methods.

extension QuickCheckoutTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = quickCheckoutCollectionVew.dequeueReusableCell(withReuseIdentifier: StringConstant.quickCheckoutCollectViewCell, for: indexPath) as! QuickCheckoutItemCollectionViewCell
        //item.layer.cornerRadius
        item.layer.borderWidth = 0.5
        item.layer.borderColor = UIColor.gray.cgColor
        item.layer.cornerRadius = 15
        item.layer.shadowRadius = 5
        item.layer.shadowColor = UIColor.red.cgColor
        item.layer.shadowOpacity = 0.7
        item.layer.shadowOffset = CGSize(width: 0, height: 5)
        return item
    }
}

//MARK: - QuickCheckoutTableViewCell's CollectionView FlowLayout methods.

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
