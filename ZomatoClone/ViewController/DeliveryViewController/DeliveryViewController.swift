//
//  DeliveryViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class DeliveryViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var filterCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpview()
    }
    
    //MARK:  - SetUpView
    
    private func setUpview()
    {
        filterCollectionView.register(UINib.init(nibName: StringConstant.filterCell, bundle: nil), forCellWithReuseIdentifier: StringConstant.filterCell)
        productsTableView.register(UINib(nibName: StringConstant.productCell, bundle: nil), forCellReuseIdentifier: StringConstant.productCell)
        productsTableView.register(UINib(nibName: StringConstant.bannerCell, bundle: nil), forCellReuseIdentifier: StringConstant.bannerCell)
        productsTableView.register(UINib(nibName: StringConstant.topBrandTableCell, bundle: nil), forCellReuseIdentifier: StringConstant.topBrandTableCell)
        productsTableView.register(UINib(nibName: StringConstant.quickCheckoutTableCell, bundle: nil), forCellReuseIdentifier: StringConstant.quickCheckoutTableCell)
        productsTableView.separatorColor = UIColor.clear
    }
    
}


extension DeliveryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterRow.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = filterCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.filterCell, for: indexPath) as! FilterCollectionViewCell
        let row = filterRow.allCases[indexPath.row]
        switch row {
            
        case .sort:
            item.filterLabel.text = row.rawValue
        case .pureveg:
            item.filterLabel.text = row.rawValue
        case .fastdelivery:
            item.filterLabel.text = row.rawValue
        case .rating:
            item.filterLabel.text = row.rawValue
        case .arrivals:
            item.filterLabel.text = row.rawValue
        case .cuisines:
            item.filterLabel.text = row.rawValue
        case .maxSafety:
            item.filterLabel.text = row.rawValue
        case .more:
            item.filterLabel.text = row.rawValue
        }
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
        print("width \(collectionWidth/4-3.5) height \(collectionHeight/2)")
        return CGSize(width: collectionWidth, height: collectionHeight)
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


extension DeliveryViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = DeliverySection.allCases[indexPath.section]
        
        switch section {
            
        case .bannerCell:
            return 250
        case .topBrandCell:
            return 250
        case .quickCheckoutCell:
            return 300
        case .eatHappyCell:
            return 250
        case .recommendedCell:
            return 200
        case .featureDCell:
            return 200
        case .amazingSnacksCell:
            return 200
        case .againBannerCell:
            return 250
        case .deliciousCell:
            return 200
        case .eveningCell:
            return 200
        case .deliciousBurgersCell:
            return 200
        case .eveningSweetCell:
            return 200
        case .desertCell:
            return 200
        case .restaurantsCell:
            return 200
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DeliverySection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = DeliverySection.allCases[indexPath.section]
        
        switch section
        {
            
        case .bannerCell:
            let bannerCell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.bannerCell, for: indexPath) as! BannerTableViewCell
            return bannerCell
            
        case .topBrandCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            return cell
        case .quickCheckoutCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.quickCheckoutTableCell, for: indexPath) as! QuickCheckoutTableViewCell
            return cell
        case .eatHappyCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            return cell
        case .recommendedCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .featureDCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .amazingSnacksCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .againBannerCell:
            let bannerCell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.bannerCell, for: indexPath) as! BannerTableViewCell
            return bannerCell
        case .deliciousCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .eveningCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .deliciousBurgersCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .eveningSweetCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .desertCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        case .restaurantsCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.productCell, for: indexPath) as! ProductTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let label : UILabel = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = UIColor.white
        headerView.backgroundColor = .white
        headerView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        let sectionTitle = DeliverySection.allCases[section]
        switch sectionTitle {
            
        case .bannerCell:
            label.text = sectionTitle.rawValue
        case .topBrandCell:
            label.text = sectionTitle.rawValue
        case .quickCheckoutCell:
            label.text = sectionTitle.rawValue
        case .eatHappyCell:
            label.text = sectionTitle.rawValue
        case .recommendedCell:
            label.text = sectionTitle.rawValue
        case .featureDCell:
            label.text = sectionTitle.rawValue
        case .amazingSnacksCell:
            label.text = sectionTitle.rawValue
        case .againBannerCell:
            label.text = sectionTitle.rawValue
        case .deliciousCell:
            label.text = sectionTitle.rawValue
        case .eveningCell:
            label.text = sectionTitle.rawValue
        case .deliciousBurgersCell:
            label.text = sectionTitle.rawValue
        case .eveningSweetCell:
            label.text = sectionTitle.rawValue
        case .desertCell:
            label.text = sectionTitle.rawValue
        case .restaurantsCell:
            label.text = sectionTitle.rawValue
        }
        return headerView
    }
    
}
