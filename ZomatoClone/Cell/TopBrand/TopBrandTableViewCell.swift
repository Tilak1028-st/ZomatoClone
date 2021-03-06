//
//  TopBrandTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class TopBrandTableViewCell: UITableViewCell {
    
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var baseViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var brandCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var seeMoreButton: UIButton!
    @IBOutlet weak var brandCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewBottomConstraint: NSLayoutConstraint!
    
    var isShowSeeMoreButton: Bool? {
        didSet {
            brandCollectionView.reloadData()
        }
    }
    var productArray: [TopBrand]?
    var imageWidth: CGFloat?
    var isShowTime: Bool = false
    var isShowBorder: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        brandCollectionView.register(UINib(nibName: StringConstant.brandItemCollectionCell, bundle: nil), forCellWithReuseIdentifier: StringConstant.brandItemCollectionCell)
        seeMoreButton.layer.borderWidth = 0.5
        seeMoreButton.layer.borderColor = UIColor.gray.cgColor
        seeMoreButton.layer.cornerRadius = 8
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

//MARK:  - TopBrandtableView's CollectionView Delegate and Datasource methods.

extension TopBrandTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if isShowSeeMoreButton ?? false
        {
            seeMoreButton.setTitle("see less", for: .normal)
            return itemEnum.allCases.count
        }
        else
        {
            seeMoreButton.setTitle("see more", for: .normal)
            return brandName.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item = brandCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.brandItemCollectionCell, for: indexPath) as! BrandItemCollectionViewCell

        item.imageWidth = self.imageWidth ?? 0.0
        item.isShowBorder = self.isShowBorder
        if isShowTime
        {
            item.timmerView.isHidden = true
        }
        else
        {
            item.timmerView.isHidden = false
        }
        item.brandArray = self.productArray?[indexPath.item]
        return item
    }
}

//MARK:  - TopBrandtableView's CollectionView FlowLayout methods.

extension TopBrandTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        
        return CGSize(width: collectionWidth/4.5, height: 147.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
}

//MARK: Enum for brandname.

enum brandName: String, CaseIterable
{
    case loPizza = "La Pino'z Pizza"
    case mcDonald = "McDonald's"
    case jayBhavani = "Jay Bhavani"
    case subway = "Subway"
    case sankalp = "Sankalp"
    case Vipul = "Vipul Dudhiya"
    case kwality = "Kwality Wall's"
    case livecake = "Live Cake Bakery"
}

enum itemEnum: Int, CaseIterable
{
    case loPizza = 1
    case mcDonald = 2
    case jayBhavani = 3
    case subway = 4
    case sankalp = 5
    case Vipul = 6
    case kwality = 7
    case livecake = 8
    case loPizza1 = 9
    case mcDonald1 = 10
    case jayBhavani1 = 11
    case subway1 = 12
    case sankalp1 = 13
    case Vipul1 = 14
    case kwality1 = 15
    case livecake1 = 16
}
