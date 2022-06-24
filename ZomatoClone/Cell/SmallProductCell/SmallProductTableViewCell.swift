//
//  SmallProductTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class SmallProductTableViewCell: UITableViewCell {

    @IBOutlet weak var smallProductCollectionViewCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        smallProductCollectionViewCell.register(UINib(nibName: StringConstant.smallProductCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: StringConstant.smallProductCollectionViewCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}


extension SmallProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item = smallProductCollectionViewCell.dequeueReusableCell(withReuseIdentifier: StringConstant.smallProductCollectionViewCell, for: indexPath) as! SmallProductCollectionViewCell
        item.layer.borderWidth = 0.5
        item.layer.borderColor = UIColor.gray.cgColor
        item.layer.cornerRadius = 12
        item.layer.shadowRadius = 5
        item.layer.shadowColor = UIColor.red.cgColor
        item.layer.shadowOpacity = 0.7
        item.layer.shadowOffset = CGSize(width: 0, height: 5)
        return item
    }
}

extension SmallProductTableViewCell: UICollectionViewDelegateFlowLayout
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
