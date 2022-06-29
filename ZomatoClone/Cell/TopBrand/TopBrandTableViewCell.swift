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
            return 8
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
        let row = brandName.allCases[indexPath.item]
        
        item.imageWidth = self.imageWidth ?? 0.0
        if isShowTime
        {
            item.timmerView.isHidden = true
        }
        else
        {
            item.timmerView.isHidden = false
        }
        item.brandArray = self.productArray?[indexPath.item]
        
//        switch row {
//        case .loPizza:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "la pino'z")
//        case .mcDonald:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "mcd")
//        case .jayBhavani:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "jaybhavani")
//        case .subway:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "subwy")
//        case .sankalp:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "sankalp")
//        case .Vipul:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "vipul")
//        case .kwality:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "kwality")
//        case .livecake:
//            item.brandNameLabel.text = row.rawValue
//            item.brandImageView.image = UIImage(named: "cake")
//        }
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
        
        return CGSize(width: collectionWidth/4.3, height: 147.5)
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
    case jayBhavani = " Jay Bhavani"
    case subway = "Subway"
    case sankalp = "Sankalp"
    case Vipul = "Vipul Dudhiya"
    case kwality = "Kwality Wall's"
    case livecake = "Live Cake Bakery"
}
