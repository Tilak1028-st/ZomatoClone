//
//  DiningViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class DiningViewController: UIViewController {

    @IBOutlet weak var diningProductTableView: UITableView!
    @IBOutlet weak var diningFilterCollectionView: UICollectionView!
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isShowSeeMoreButton: Bool = false
    var currentLocation: String = "Mumbai"
    
    var arrayTopBrand = [TopBrand]()
    var arrDiningProduct = [TopBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpSearchBar()
        setDiningProductDetails()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leftBarButton.title = currentLocation
    }
    
    //MARK: setupView
    private func setUpView()
    {
        Utility.registerCollectionViewCell(collectionView: diningFilterCollectionView, cellName: StringConstant.filterCell)
        Utility.registerCell(tableView: diningProductTableView, cellName: StringConstant.topBrandTableCell)
        Utility.registerCell(tableView: diningProductTableView, cellName: StringConstant.restaurantCell)
        
       
        diningProductTableView.separatorColor = UIColor.clear
        
        let dummyViewHeight = CGFloat(40)
        self.diningProductTableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.diningProductTableView.bounds.size.width, height: dummyViewHeight))
        self.diningProductTableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
        diningProductTableView.reloadData()
    }
    
 //MARK: SetUpSearchvBar for Dining tab/
    private func setUpSearchBar()
    {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.red
            }
        }
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search Resturant or Cafe",
            attributes: [.foregroundColor: UIColor.red]
        )
    }
    
    @IBAction func seeMorePressed(_ sender: UIButton) {
        isShowSeeMoreButton = !isShowSeeMoreButton
        self.diningProductTableView.reloadData()
    }
    
//MARK: Function will openMap Sheet
    @IBAction func openMap(_ sender: UIBarButtonItem)
    {
        let shareVc = storyboard?.instantiateViewController(withIdentifier: StringConstant.locationSearchVc) as! LocationSearchViewController
        
        if let sheet = shareVc.sheetPresentationController {
            sheet.detents = [ .medium(), .large()]
        }
        shareVc.navController = self.navigationController
        present(shareVc, animated: true, completion: nil)
    }
}

//MARK: - Filter CollectionView Delegate and Datasource methods.

extension DiningViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterRow.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = diningFilterCollectionView.dequeueReusableCell(withReuseIdentifier: StringConstant.filterCell, for: indexPath) as! FilterCollectionViewCell
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

//MARK: Extension for product tableview delegate and datasource methods.

extension DiningViewController: UITableViewDelegate, UITableViewDataSource
{
    func numberOfSections(in tableView: UITableView) -> Int {
        return DiningSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cellForRow(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DiningSection.allCases[indexPath.section] == .brandCell
        {
            if isShowSeeMoreButton
            {
                return 590 + 5 + 30
            } else
            {
                return  295 + 5 + 30
            }
        }
        else
        {
            return 330
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeader(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 || section == 3 || section == 4 {
            return 5
        }
        else
        {
            return 30
        }
    }
}


extension DiningViewController
{
 //MARK: function to setup cellforrow for diningProductTableview.
    
    private func cellForRow(indexPath: IndexPath) -> UITableViewCell
    {
        let section = DiningSection.allCases[indexPath.section]
        
        switch section
        {
        case .brandCell:
            let cell = diningProductTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            cell.isShowTime = true
            cell.productArray = arrDiningProduct
            cell.imageWidth = 5
            cell.seeMoreButton.addTarget(self, action: #selector(seeMorePressed(_:)), for: .touchUpInside)
            cell.isShowSeeMoreButton = self.isShowSeeMoreButton
            cell.brandCollectionView.reloadData()
            return cell
        case .curatedCell, .popularcell, .popularagaincell, .popularRepeatCell:
            let cell = diningProductTableView.dequeueReusableCell(withIdentifier: StringConstant.restaurantCell, for: indexPath) as! RestaurantableViewCell
            cell.cellView.layer.borderWidth = 0.5
            cell.cellView.layer.borderColor = UIColor.gray.cgColor
            cell.cellView.layer.cornerRadius = 12
            cell.cellView.layer.shadowRadius = 5
            cell.cellView.layer.shadowColor = UIColor.gray.cgColor
            cell.cellView.layer.shadowOpacity = 0.7
            cell.cellView.layer.shadowOffset = CGSize(width: 0, height: 5)
            cell.productImageView.layer.cornerRadius = 12
            return cell
        case .discoverResCell:
            let cell = diningProductTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            cell.productArray = arrayTopBrand
            cell.isShowSeeMoreButton = self.isShowSeeMoreButton
            cell.imageWidth = 5
            cell.isShowTime = true
            return cell
        }
    }
    
    //MARK:  - Product tableView Section header
    
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
        
        label.text = DiningSection.allCases[section].rawValue
        return headerView
    }
}


extension DiningViewController
{
    func setDiningProductDetails()
    {
        arrayTopBrand.append(TopBrand.init(brandName: "Outdoor", brandImage: UIImage(named: "outdoor")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Romantic", brandImage: UIImage(named: "romantic")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Cafe", brandImage: UIImage(named: "cafe")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Events", brandImage: UIImage(named: "events")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Serves Jain food", brandImage: UIImage(named: "jain")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Family Dining", brandImage: UIImage(named: "dining")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Buffet", brandImage: UIImage(named: "buffet")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Desserts", brandImage: UIImage(named: "desert")!))
        
        arrayTopBrand.append(TopBrand.init(brandName: "Outdoor", brandImage: UIImage(named: "outdoor")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Romantic", brandImage: UIImage(named: "romantic")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Cafe", brandImage: UIImage(named: "cafe")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Events", brandImage: UIImage(named: "events")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Serves Jain food", brandImage: UIImage(named: "jain")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Family Dining", brandImage: UIImage(named: "dining")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Buffet", brandImage: UIImage(named: "buffet")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Desserts", brandImage: UIImage(named: "desert")!))
        
        
        arrDiningProduct.append(TopBrand.init(brandName: "Outdoor", brandImage: UIImage(named: "outdoor")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Romantic", brandImage: UIImage(named: "romantic")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Cafe", brandImage: UIImage(named: "cafe")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Events", brandImage: UIImage(named: "events")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Serves Jain food", brandImage: UIImage(named: "jain")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Family Dining", brandImage: UIImage(named: "dining")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Buffet", brandImage: UIImage(named: "buffet")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Desserts", brandImage: UIImage(named: "desert")!))
        
        arrDiningProduct.append(TopBrand.init(brandName: "Healthy", brandImage: UIImage(named: "healthy-1")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Pure Veg", brandImage: UIImage(named: "veg")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Kid Friendly", brandImage: UIImage(named: "kid")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Breakfast", brandImage: UIImage(named: "breakfast")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Snacks", brandImage: UIImage(named: "snacks")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Wifi", brandImage: UIImage(named: "wifi")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Brunch", brandImage: UIImage(named: "breakfast")!))
        arrDiningProduct.append(TopBrand.init(brandName: "Self Service", brandImage: UIImage(named: "self")!))
        
    }
    
}
