//
//  DeliveryTypeEnum.swift
//  ZomatoClone
//
//  Created by PCS213 on 23/06/22.
//

import Foundation
import CoreText
import UIKit

enum DeliverySection: String, CaseIterable
{
    case bannerCell = ""
    case topBrandCell = "Top Brands for you"
    case quickCheckoutCell = "Quick checkout munchies"
    case eatHappyCell = "Eat what makes you happy"
    case recommendedCell = "Recommended for you"
    case featureDCell = "Featured Restaurants"
    case amazingSnacksCell = "Amazing snacks"
    case againBannerCell = " "
    case deliciousCell = "Delicious sandwiches"
    case eveningCell = "Evening bestsellers"
    case deliciousBurgersCell = "Delicious burgers"
    case eveningSweetCell = "Some evening sweets"
    case desertCell = "Amazing desserts"
    case restaurantsCell = "100+ restaurants around you"
}



enum filterRow: String, CaseIterable
{
    case sort = "Sort"
    case pureveg = "Pure Veg"
    case fastdelivery = "Fast Delivery"
    case rating = "Rating 4.0+"
    case arrivals = "New Arrivals"
    case cuisines = "Cuisines"
    case maxSafety = "MAX Safety"
    case more = "More"
}


enum smallProductImage
{
    
    static let image1 = UIImage(named: "food1")
    static let image2 = UIImage(named: "food2")
    static let image3 = UIImage(named: "food3")
    static let image4 = UIImage(named: "food4")
    static let image5 = UIImage(named: "food5")
}

enum featuredResturantImage
{
    static let image1 = UIImage(named: "food1")
    static let image2 = UIImage(named: "food6")
    static let image3 = UIImage(named: "food3")
    static let image4 = UIImage(named: "food7")
    static let image5 = UIImage(named: "food2")
}

enum quickcheckoutImage
{
    static let image1 = UIImage(named: "food1")
    static let image2 = UIImage(named: "food6")
    static let image3 = UIImage(named: "food3")
    static let image4 = UIImage(named: "food7")
    static let image5 = UIImage(named: "food2")
}

enum recommendedForYouImage
{
    static let image1 = UIImage(named: "food1")
    static let image2 = UIImage(named: "food6")
    static let image3 = UIImage(named: "food3")
    static let image4 = UIImage(named: "food7")
    static let image5 = UIImage(named: "food2")
}

enum tableCellImage
{
    
}
