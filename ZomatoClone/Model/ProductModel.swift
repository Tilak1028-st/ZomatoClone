//
//  ProductModel.swift
//  ZomatoClone
//
//  Created by PCS213 on 28/06/22.
//

import Foundation
import UIKit

class Product
{
    var productName: String
    var discountOffer: Int
    var rating: String
    var productImage: UIImage
    var reachTime: Int
    var productPrice: String
    
    init(productName: String, productDiscount: Int, productRating: String, productImage: UIImage, productDeliveryTime: Int, productPrice: String)
    {
        self.productName = productName
        self.discountOffer = productDiscount
        self.rating = productRating
        self.productImage = productImage
        self.reachTime = productDeliveryTime
        self.productPrice = productPrice
    }
}

