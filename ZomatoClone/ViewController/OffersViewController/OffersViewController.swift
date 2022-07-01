//
//  OffersViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class OffersViewController: UIViewController {
    
    
    @IBOutlet weak var offerSearchBar: UISearchBar!
    @IBOutlet weak var offerTableView: UITableView!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    
    private var currentLocation: String = "Mumbai"
    var isShowSeeMoreButton: Bool = false
    var arrDiningProduct = [TopBrand]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setUpView()
        setUpDetails()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        let navTitle = UIBarButtonItem(title: currentLocation, style: UIBarButtonItem.Style.done, action: self.openMap)
        let navImage = UIBarButtonItem(image: UIImage(systemName: "mappin"), style: UIBarButtonItem.Style.done, action: self.openMap)
        navImage.tintColor = UIColor.red
        navTitle.tintColor = UIColor.black
        self.navigationItem.leftBarButtonItems = [navImage, navTitle]
    }
    
    private func setUpView()
    {
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.bannerCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.restaurantCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.crazyTableViewCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.topBrandTableCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.mostLovedTableViewcell)
        
        offerTableView.separatorColor = UIColor.clear
        
        let dummyViewHeight = CGFloat(40)
        self.offerTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.offerTableView.bounds.size.width, height: dummyViewHeight))
        self.offerTableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
        offerTableView.reloadData()
    }
    
    private func setUpSearchBar()
    {
        if let textfield = offerSearchBar.value(forKey: "searchField") as? UITextField {
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.red
            }
        }
        offerSearchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Resturants",
            attributes: [.foregroundColor: UIColor.red]
        )
    }
    
    
    private func viewForHeader(section: Int) -> UIView
    {
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
        
        label.text = offerSection.allCases[section].rawValue
        return headerView
    }
}


extension OffersViewController: UITableViewDataSource, UITableViewDelegate
{
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return offerSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = offerSection.allCases[indexPath.section]
        
        switch section
        {
            
        case .offerCell:
            let bannerCell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.bannerCell, for: indexPath) as! BannerTableViewCell
            return bannerCell
        case .crazyOfferCell:
            let bannerCell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.crazyTableViewCell, for: indexPath) as! CrazyOfferableViewCell
            return bannerCell
        case .mostLovedCell:
            let mostLovedCell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.mostLovedTableViewcell, for: indexPath) as! MostLovedTableViewCell
            return mostLovedCell
        case .topDishCell:
            let cell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            cell.isShowTime = true
            cell.productArray = arrDiningProduct
            cell.imageWidth = 2
            cell.isShowBorder = false
            cell.seeMoreButton.isHidden = true
            return cell
        case .bestOfferCell:
            let cell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.restaurantCell, for: indexPath) as! RestaurantableViewCell
            cell.cellView.layer.borderWidth = 0.5
            cell.cellView.layer.borderColor = UIColor.gray.cgColor
            cell.cellView.layer.cornerRadius = 12
            cell.cellView.layer.shadowRadius = 5
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOpacity = 0.7
            cell.cellView.layer.shadowOffset = CGSize(width: 0, height: 5)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if offerSection.allCases[indexPath.section] == .offerCell
        {
            return 250
        }
        else if offerSection.allCases[indexPath.section] == .mostLovedCell
        {
            return 100
        }
        else if offerSection.allCases[indexPath.section] == .crazyOfferCell
        {
            return 200
        }
        else if offerSection.allCases[indexPath.section] == .topDishCell
        {
            return 145
        }
        else
        {
            return 300
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0  || section == 4
        {
            return 5
        }
        else if section == 1
        {
            return 0
        }
        else
        {
            return 30
        }
    }
}


extension OffersViewController
{
    func setUpDetails()
    {
        arrDiningProduct.append(TopBrand.init(brandName: "Pizza", brandImage: UIImage(named: "pizza")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Chaat", brandImage: UIImage(named: "chaat")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Burger", brandImage: UIImage(named: "burger1")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Sandwich", brandImage: UIImage(named: "sandwich")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Healthy", brandImage: UIImage(named: "healthy-1")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Pure Veg", brandImage: UIImage(named: "veg")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Kid Friendly", brandImage: UIImage(named: "kid")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Breakfast", brandImage: UIImage(named: "breakfast")!))
    }
}
