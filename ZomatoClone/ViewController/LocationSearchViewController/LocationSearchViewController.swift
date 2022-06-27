//
//  LocationSearchViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 27/06/22.
//

import UIKit

class LocationSearchViewController: UIViewController {

     var navController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func getCurrentLocation(_ sender: UIButton) {
        self.dismiss(animated: true)
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: StringConstant.mapVc) as! MapViewController
        self.navController?.pushViewController(nextViewController, animated: true)
    }
    
}
