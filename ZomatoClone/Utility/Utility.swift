//
//  Utility.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import Foundation
import UIKit

class Utility
{
    static func registerCell(tableView: UITableView, cellName: String)
    {
        tableView.register(UINib(nibName: cellName, bundle: nil), forCellReuseIdentifier: cellName)
    }
    
    static func registerCollectionViewCell(collectionView: UICollectionView, cellName: String)
    {
        collectionView.register(UINib(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
    }
}

