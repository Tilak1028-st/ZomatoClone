//
//  MapViewController.swift
//  ZomatoClone
//
//  Created by PCS213 on 27/06/22.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIBarButtonItem()
         backButton.title = "  Choose Your Location"
        backButton.tintColor = UIColor.black
         self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
}
