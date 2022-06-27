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
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    
    
    var isShowSeeMoreButton: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpview()
    }
    
    @IBAction func seeMorePressed(_ sender: UIButton) {
        isShowSeeMoreButton = !isShowSeeMoreButton
        self.productsTableView.reloadData()
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
        let dummyViewHeight = CGFloat(40)
        
        self.productsTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.productsTableView.bounds.size.width, height: dummyViewHeight))
        self.productsTableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
       // leftBarButton.title = "New York"
        
       
    }
    
    @IBAction func openMap(_ sender: UIBarButtonItem)
    {
        let shareVc = storyboard?.instantiateViewController(withIdentifier: StringConstant.locationSearchVc) as! LocationSearchViewController
        
        if let sheet = shareVc.sheetPresentationController {
            sheet.detents = [ .medium(), .large()]
        }
        shareVc.navController = self.navigationController
        present(shareVc, animated: true, completion: nil)
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
            cell.isShowSeeMoreButton = self.isShowSeeMoreButton
     //       cell.seeMoreButton.isHidden = true
            return cell
        case .quickCheckoutCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.quickCheckoutTableCell, for: indexPath) as! QuickCheckoutTableViewCell
            return cell
        case .eatHappyCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            cell.seeMoreButton.addTarget(self, action: #selector(seeMorePressed(_:)), for: .touchUpInside)
            cell.isShowSeeMoreButton = isShowSeeMoreButton
            cell.brandCollectionView.reloadData()

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
        }
        else if DeliverySection.allCases[indexPath.section] == .topBrandCell
        {
            return 330
        }
        else if DeliverySection.allCases[indexPath.section] == .eatHappyCell
        {
            if isShowSeeMoreButton {
                return 590 + 5 + 30
            } else {
                return  295 + 5 + 30
            }
        }
        else
        {
            return 250
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else
        {
            return 30
        }

    }
}
