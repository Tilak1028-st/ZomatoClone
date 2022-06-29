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
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    private func setUpView()
    {
        Utility.registerCollectionViewCell(collectionView: diningFilterCollectionView, cellName: StringConstant.filterCell)
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
