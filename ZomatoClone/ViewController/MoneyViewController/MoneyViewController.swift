//
//  MoneyViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import UIKit

class MoneyViewController: UIViewController {
    
    @IBOutlet weak var moneyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utility.registerCell(tableView: moneyTableView, cellName: StringConstant.moneyTableViewcell)
    }
}

extension MoneyViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = moneyTableView.dequeueReusableCell(withIdentifier: StringConstant.moneyTableViewcell, for: indexPath) as! MoneyTableViewCell
        if indexPath.row == 0
        {
            cell.moneyImageView.image = UIImage(named: "thunder")
            cell.moneyHeadLineLabel.text = "One-click checkout"
            cell.moneySubHeadLineLabel.text = "No need to wait for OTPs- payments get processed instantly"
        }
        else
        {
            cell.moneyHeadLineLabel.text = "Safe and secure"
            cell.moneySubHeadLineLabel.text = "No need to wait for OTPs- payments get processed instantly"
        }
        return cell
    }
    
    
}
