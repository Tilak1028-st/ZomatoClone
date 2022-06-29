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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        leftBarButton.title = currentLocation
    }
    
    private func setUpView()
    {
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.bannerCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.restaurantCell)
        Utility.registerCell(tableView: offerTableView, cellName: StringConstant.crazyTableViewCell)
        
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
            
        case .topDishCell, .mostLovedCell, .bestOfferCell:
            let cell = offerTableView.dequeueReusableCell(withIdentifier: StringConstant.restaurantCell, for: indexPath) as! RestaurantableViewCell
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if offerSection.allCases[indexPath.section] == .offerCell
        {
           return 250
        }
        else
        {
            return 300
        }
        
    }
}
