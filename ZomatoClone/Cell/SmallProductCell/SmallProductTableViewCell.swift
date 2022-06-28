//
//  SmallProductTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class SmallProductTableViewCell: UITableViewCell {

    @IBOutlet weak var smallProductCollectionViewCell: UICollectionView!
    var productArray: [Product]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Utility.registerCollectionViewCell(collectionView: smallProductCollectionViewCell, cellName: StringConstant.smallProductCollectionViewCell)
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK: - SmallProduct CollectionView Delegate and datasource methods.

extension SmallProductTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return productArray?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        return cellForRow(indexPath: indexPath)
    }
}

//MARK: - SmallProduct CollectionView FlowLayout methods.

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



extension SmallProductTableViewCell
{
    func cellForRow(indexPath: IndexPath) -> UICollectionViewCell
    {
        let item = smallProductCollectionViewCell.dequeueReusableCell(withReuseIdentifier: StringConstant.smallProductCollectionViewCell, for: indexPath) as! SmallProductCollectionViewCell
        item.layer.borderWidth = 0.5
        item.layer.borderColor = UIColor.gray.cgColor
        item.layer.cornerRadius = 15
        item.layer.shadowRadius = 5
        item.layer.shadowOpacity = 0.7
        item.layer.shadowOffset = CGSize(width: 0, height: 5)
        item.smallProductArray = productArray?[indexPath.item]
        
//        switch indexPath.item {
//        case 0:
//            item.smallProductImage.image = smallProductImage.image1
//        case 1:
//            item.smallProductImage.image = smallProductImage.image2
//        case 2:
//            item.smallProductImage.image = smallProductImage.image3
//        case 3:
//            item.smallProductImage.image = smallProductImage.image4
//        case 4:
//            item.smallProductImage.image = smallProductImage.image5
//
//        default:
//            item.smallProductImage.image = smallProductImage.image1
//
//        }
        return item
    }
}
