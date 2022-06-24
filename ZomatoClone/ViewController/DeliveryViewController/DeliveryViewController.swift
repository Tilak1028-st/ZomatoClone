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
        Utility.registerCollectionViewCell(collectionView: filterCollectionView, cellName: StringConstant.filterCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.productCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.bannerCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.topBrandTableCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.quickCheckoutTableCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.smallProductTableCell)
        Utility.registerCell(tableView: productsTableView, cellName: StringConstant.restaurantCell)
        
        productsTableView.separatorColor = UIColor.clear
    }
    
    //MARK:  - Product tableView Section header
    
    private func viewForHeader(section: Int) -> UIView {
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
        
        label.text = DeliverySection.allCases[section].rawValue
        return headerView
    }
    
    // MARK: - Product tableview cell for row.
    private func cellForRow(indexPath: IndexPath) -> UITableViewCell
    {
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
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            return cell
        case .featureDCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            return cell
        case .amazingSnacksCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            return cell
        case .againBannerCell:
            let bannerCell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.bannerCell, for: indexPath) as! BannerTableViewCell
            return bannerCell
        case .deliciousCell, .eveningCell, .deliciousBurgersCell, .eveningSweetCell, .desertCell :
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            return cell
        case .restaurantsCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.restaurantCell, for: indexPath) as! RestaurantableViewCell
            cell.cellView.layer.borderWidth = 0.5
           // cell.cellView.layer.masksToBounds = false
            cell.cellView.layer.borderColor = UIColor.gray.cgColor
            cell.cellView.layer.cornerRadius = 12
            cell.cellView.layer.shadowRadius = 5
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOpacity = 0.7
            cell.cellView.layer.shadowOffset = CGSize(width: 0, height: 5)
            cell.productImageView.layer.cornerRadius = 12
            return cell
        }
    }
}

//MARK: - Filter CollectionView Delegate and Datasource methods.

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
        item.filterLabel.text = filterRow.allCases[indexPath.row].rawValue
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let collectionWidth = collectionView.bounds.width
        let collectionHeight = collectionView.bounds.height
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

//MARK: - Product tableview delegate and datasource methods.

extension DeliveryViewController: UITableViewDelegate, UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return DeliverySection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DeliverySection.allCases[indexPath.section] == .quickCheckoutCell || DeliverySection.allCases[indexPath.section] == .restaurantsCell {
            return 300
        } else {
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(section: section)
    }
}
