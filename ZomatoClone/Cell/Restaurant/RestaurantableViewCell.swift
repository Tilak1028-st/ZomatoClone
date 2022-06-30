//
//  RestaurantableViewCell.swift
//  ZomatoClone
//
//  Created by PCS213 on 24/06/22.
//

import UIKit

class RestaurantableViewCell: UITableViewCell {
    
    @IBOutlet weak var offerButton: UIButton!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var ProImageView: UIImageView!
    
    let array: [UIImage] = [UIImage(named: "food1")!,UIImage(named: "food2")!, UIImage(named: "food3")!]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        DispatchQueue.main.async {
            self.offerButton.clipsToBounds = true
            self.offerButton.layer.cornerRadius = 7
            self.offerButton.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        }
        repeatAnimateImagesChanges(images: array as NSArray, imageView: self.ProImageView)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func repeatAnimateImagesChanges(images:NSArray, imageView:UIImageView) {
        
        if(images.count == 0) {
            return
        }
        
        var newImage = images.firstObject as! UIImage
        
        if(imageView.image != nil) {
            for i in 0..<images.count {
                newImage = images.object(at: i) as! UIImage
                if(imageView.image?.isEqual(newImage))! {
                    newImage = i == images.count - 1 ? images.firstObject as! UIImage : images.object(at: i + 1) as! UIImage
                }
            }
        }
        
        imageView.image = newImage
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.repeatAnimateImagesChanges(images: images, imageView: imageView)
        }
    }
}
