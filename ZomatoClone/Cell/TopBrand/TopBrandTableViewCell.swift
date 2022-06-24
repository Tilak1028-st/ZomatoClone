//
//  TopBrandTableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class TopBrandTableViewCell: UITableViewCell {

    @IBOutlet weak var brandCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        brandCollectionView.register(UINib(nibName: StringConstant.brandItemCollectionCell, bundle: nil), forCellWithReuseIdentifier: StringConstant.brandItemCollectionCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

extension TopBrandTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource
{
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return brandName.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item = brandCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.brandItemCollectionCell, for: indexPath) as! BrandItemCollectionViewCell
        let row = brandName.allCases[indexPath.item]
        
        switch row {
            
        case .loPizza:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "la pino'z")
        case .mcDonald:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "mcd")
        case .jayBhavani:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "jaybhavani")
        case .subway:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "subwy")
        case .sankalp:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "sankalp")
        case .Vipul:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "vipul")
        case .kwality:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "kwality")
        case .livecake:
            item.brandNameLabel.text = row.rawValue
            item.brandImageView.image = UIImage(named: "cake")
        }
        return item
    }
}

extension TopBrandTableViewCell: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        print("width \(collectionWidth/4-3.5) height \(collectionHeight/2)")
        return CGSize(width: collectionWidth/4.3-2, height: collectionHeight/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat
    {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return 0
    }
}

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
