//
//  ViewControllerExtension.swift
//  ZomatoClone
//
//  Created by PCS213 on 01/07/22.
//

import Foundation
import UIKit

extension UIViewController {
    @objc func openMap() {
        let shareVc = storyboard?.instantiateViewController(withIdentifier: StringConstant.locationSearchVc) as! LocationSearchViewController
        
        if let sheet = shareVc.sheetPresentationController {
            sheet.detents = [ .medium(), .large()]
        }
        shareVc.navController = self.navigationController
        self.present(shareVc, animated: true, completion: nil)
    }
}
