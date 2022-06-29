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
    var currentLocation: String = "Mumbai"
    
    var arrFeturesProducts = [Product]()
    var arrRecommendedProducts = [Product]()
    var arrayAmazingSnacksProducts = [Product]()
    var arrDeliciousProducts = [Product]()
    var arrBurgerProducts = [Product]()
    var arrSweetsProducts = [Product]()
    var arrDesertProducts = [Product]()
    
    var arrayTopBrand = [TopBrand]()
    var arrayEatHappy = [TopBrand]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpview()
        setUpProductDetails()
        setUpSearchBar()
    }
    
    @IBAction func seeMorePressed(_ sender: UIButton) {
        isShowSeeMoreButton = !isShowSeeMoreButton
        self.productsTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leftBarButton.title = currentLocation
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
        productsTableView.reloadData()
    }
    
// MARK: SetUpSearchBar
    private func setUpSearchBar()
    {
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            if let leftView = textfield.leftView as? UIImageView {
                leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                leftView.tintColor = UIColor.red
            }
        }
        searchBar.searchTextField.attributedPlaceholder = NSAttributedString(
            string: "Search icecream",
            attributes: [.foregroundColor: UIColor.red]
        )
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
            cell.imageWidth = 2
            cell.isShowSeeMoreButton = self.isShowSeeMoreButton
            cell.productArray = arrayTopBrand
        //    cell.seeMoreButton.isHidden = true
            return cell
        case .quickCheckoutCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.quickCheckoutTableCell, for: indexPath) as! QuickCheckoutTableViewCell
            return cell
        case .eatHappyCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.topBrandTableCell, for: indexPath) as! TopBrandTableViewCell
            cell.isShowTime = true
            cell.productArray = arrayEatHappy
            cell.seeMoreButton.addTarget(self, action: #selector(seeMorePressed(_:)), for: .touchUpInside)
            cell.isShowSeeMoreButton = isShowSeeMoreButton
            cell.imageWidth = 2
            cell.brandCollectionView.reloadData()
            return cell
        case .recommendedCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrRecommendedProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .featureDCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrFeturesProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .amazingSnacksCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrayAmazingSnacksProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .againBannerCell:
            let bannerCell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.bannerCell, for: indexPath) as! BannerTableViewCell
            return bannerCell
        case .eveningCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrDeliciousProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .deliciousCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrDeliciousProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .deliciousBurgersCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrBurgerProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .eveningSweetCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrSweetsProducts
            cell.smallProductCollectionViewCell.reloadData()
            return cell
        case .desertCell:
            let cell = productsTableView.dequeueReusableCell(withIdentifier: StringConstant.smallProductTableCell, for: indexPath) as! SmallProductTableViewCell
            cell.productArray = self.arrDesertProducts
            cell.smallProductCollectionViewCell.reloadData()
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


extension DeliveryViewController {
    func setUpProductDetails()
    {
        //Features products
        arrFeturesProducts.append(Product.init(productName: "Puffizza", productDiscount: 40, productRating: "3", productImage: UIImage(named: "food1")!, productDeliveryTime: 32, productPrice: "125 for one"))
        arrFeturesProducts.append(Product.init(productName: "Cake Live", productDiscount: 50, productRating: "4", productImage: UIImage(named: "food2")!, productDeliveryTime: 40, productPrice: "100 for one"))
        arrFeturesProducts.append(Product.init(productName: "Honest", productDiscount: 40, productRating: "3", productImage: UIImage(named: "food3")!, productDeliveryTime: 23, productPrice: "150 for one"))
        arrFeturesProducts.append(Product.init(productName: "Jay Bhavani", productDiscount: 50, productRating: "4", productImage: UIImage(named: "food4")!, productDeliveryTime: 27, productPrice: "175 for one"))
        arrFeturesProducts.append(Product.init(productName: "City corner", productDiscount: 60, productRating: "4", productImage: UIImage(named: "food5")!, productDeliveryTime: 35, productPrice: "200 for one"))
        
        //RecommendedProducts
        arrRecommendedProducts.append(Product.init(productName: "Burger King", productDiscount: 60, productRating: "3", productImage: UIImage(named: "food6")!, productDeliveryTime: 35, productPrice: "150 for one"))
        arrRecommendedProducts.append(Product.init(productName: "Cake Live", productDiscount: 50, productRating: "4", productImage: UIImage(named: "food5")!, productDeliveryTime: 40, productPrice: "100 for one"))
        arrRecommendedProducts.append(Product.init(productName: "Honest", productDiscount: 40, productRating: "3", productImage: UIImage(named: "food7")!, productDeliveryTime: 23, productPrice: "170 for one"))
        arrRecommendedProducts.append(Product.init(productName: "Jay Bhavani", productDiscount: 50, productRating: "4", productImage: UIImage(named: "food1")!, productDeliveryTime: 27, productPrice: "180 for one"))
        arrRecommendedProducts.append(Product.init(productName: "City corner", productDiscount: 60, productRating: "4", productImage: UIImage(named: "food3")!, productDeliveryTime: 35, productPrice: "220 for one"))
        
        //snacks
        arrayAmazingSnacksProducts.append(Product.init(productName: "Honest", productDiscount: 88, productRating: "3", productImage: UIImage(named: "snacks1")!, productDeliveryTime: 32, productPrice: "125 for one"))
        arrayAmazingSnacksProducts.append(Product.init(productName: "Ashirwad", productDiscount: 77, productRating: "4", productImage: UIImage(named: "snacks2")!, productDeliveryTime: 40, productPrice: "100 for one"))
        arrayAmazingSnacksProducts.append(Product.init(productName: "PFZ", productDiscount: 33, productRating: "3", productImage: UIImage(named: "snacks3")!, productDeliveryTime: 20, productPrice: "150 for one"))
        arrayAmazingSnacksProducts.append(Product.init(productName: "Jay Bhavani", productDiscount: 55, productRating: "4", productImage: UIImage(named: "snacks4")!, productDeliveryTime: 35, productPrice: "175 for one"))
        arrayAmazingSnacksProducts.append(Product.init(productName: "City corner", productDiscount: 66, productRating: "4", productImage: UIImage(named: "snacks5")!, productDeliveryTime: 45, productPrice: "200 for one"))
        
       //delicious
        arrDeliciousProducts.append(Product.init(productName: "Puffizza", productDiscount: 40, productRating: "3", productImage: UIImage(named: "delicious1")!, productDeliveryTime: 32, productPrice: "125 for one"))
        arrDeliciousProducts.append(Product.init(productName: "Cake Live", productDiscount: 50, productRating: "4", productImage: UIImage(named: "delicious2")!, productDeliveryTime: 40, productPrice: "100 for one"))
        arrDeliciousProducts.append(Product.init(productName: "Honest", productDiscount: 40, productRating: "3", productImage: UIImage(named: "delicious3")!, productDeliveryTime: 23, productPrice: "150 for one"))
        arrDeliciousProducts.append(Product.init(productName: "Jay Bhavani", productDiscount: 50, productRating: "4", productImage: UIImage(named: "delicious4")!, productDeliveryTime: 27, productPrice: "175 for one"))
        arrDeliciousProducts.append(Product.init(productName: "City corner", productDiscount: 60, productRating: "4", productImage: UIImage(named: "delicious5")!, productDeliveryTime: 35, productPrice: "200 for one"))
        
        //burger
        arrBurgerProducts.append(Product.init(productName: "Diya Fast food", productDiscount: 35, productRating: "3", productImage: UIImage(named: "burger1")!, productDeliveryTime: 32, productPrice: "125 for one"))
        arrBurgerProducts.append(Product.init(productName: "Burgerwale", productDiscount: 75, productRating: "4", productImage: UIImage(named: "burger2")!, productDeliveryTime: 10, productPrice: "100 for one"))
        arrBurgerProducts.append(Product.init(productName: "Kutchi Marnavati", productDiscount: 45, productRating: "3", productImage: UIImage(named: "burger3")!, productDeliveryTime: 20, productPrice: "150 for one"))
        arrBurgerProducts.append(Product.init(productName: "Tummy Fillers", productDiscount: 55, productRating: "4", productImage: UIImage(named: "burger4")!, productDeliveryTime: 25, productPrice: "175 for one"))
        arrBurgerProducts.append(Product.init(productName: "McDonalds'", productDiscount: 65, productRating: "4", productImage: UIImage(named: "burger5")!, productDeliveryTime: 40, productPrice: "200 for one"))
        
        //sweets
        
        arrSweetsProducts.append(Product.init(productName: "Puffizza", productDiscount: 60, productRating: "3", productImage: UIImage(named: "sweet1")!, productDeliveryTime: 30, productPrice: "125 for one"))
        arrSweetsProducts.append(Product.init(productName: "Cake Live", productDiscount: 70, productRating: "4", productImage: UIImage(named: "sweet2")!, productDeliveryTime: 45, productPrice: "100 for one"))
        arrSweetsProducts.append(Product.init(productName: "Honest", productDiscount: 45, productRating: "3", productImage: UIImage(named: "sweet3")!, productDeliveryTime: 28, productPrice: "150 for one"))
        arrSweetsProducts.append(Product.init(productName: "Jay Bhavani", productDiscount: 35, productRating: "4", productImage: UIImage(named: "sweet4")!, productDeliveryTime: 7, productPrice: "175 for one"))
        arrSweetsProducts.append(Product.init(productName: "City corner", productDiscount: 78, productRating: "4", productImage: UIImage(named: "sweet5")!, productDeliveryTime: 45, productPrice: "200 for one"))
        
        //desert
        
        arrDesertProducts.append(Product.init(productName: "Havmor Hav", productDiscount: 80, productRating: "3", productImage: UIImage(named: "desert1")!, productDeliveryTime: 32, productPrice: "125 for one"))
        arrDesertProducts.append(Product.init(productName: "Cake Live", productDiscount: 30, productRating: "4", productImage: UIImage(named: "desert2")!, productDeliveryTime: 40, productPrice: "100 for one"))
        arrDesertProducts.append(Product.init(productName: "Puffing", productDiscount: 45, productRating: "3", productImage: UIImage(named: "desert3")!, productDeliveryTime: 23, productPrice: "150 for one"))
        arrDesertProducts.append(Product.init(productName: "Dangee dums", productDiscount: 55, productRating: "4", productImage: UIImage(named: "desert4")!, productDeliveryTime: 27, productPrice: "175 for one"))
        arrDesertProducts.append(Product.init(productName: "City corner", productDiscount: 68, productRating: "4", productImage: UIImage(named: "desert5")!, productDeliveryTime: 35, productPrice: "200 for one"))
        
        
        // TopBrand
        arrayTopBrand.append(TopBrand.init(brandName: "La Pino'z Pizza", brandImage: UIImage(named: "la pino'z")!))
        arrayTopBrand.append(TopBrand.init(brandName: "McDonald's", brandImage: UIImage(named: "mcd")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Jay Bhavani", brandImage: UIImage(named: "jaybhavani")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Subway", brandImage: UIImage(named: "subwy")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Sankalp", brandImage: UIImage(named: "sankalp")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Vipul Dudhiya", brandImage: UIImage(named: "vipul")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Kwality Wall's", brandImage: UIImage(named: "kwality")!))
        arrayTopBrand.append(TopBrand.init(brandName: "Live Cake Bakery", brandImage: UIImage(named: "cake")!))
        
        arrayEatHappy.append(TopBrand.init(brandName: "Healthy", brandImage: UIImage(named: "la pino'z")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Pizza", brandImage: UIImage(named: "mcd")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Thali", brandImage: UIImage(named: "jaybhavani")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Chaat", brandImage: UIImage(named: "subwy")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Briyani", brandImage: UIImage(named: "sankalp")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Sandwich", brandImage: UIImage(named: "vipul")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Home Style", brandImage: UIImage(named: "kwality")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Burger", brandImage: UIImage(named: "cake")!))
        
        arrayEatHappy.append(TopBrand.init(brandName: "Chicken", brandImage: UIImage(named: "la pino'z")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Fries", brandImage: UIImage(named: "mcd")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Vada", brandImage: UIImage(named: "jaybhavani")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Pratha", brandImage: UIImage(named: "subwy")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Chhaach", brandImage: UIImage(named: "sankalp")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Dosa", brandImage: UIImage(named: "vipul")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Dal", brandImage: UIImage(named: "kwality")!))
        arrayEatHappy.append(TopBrand.init(brandName: "Samosa", brandImage: UIImage(named: "cake")!))
    }
}
