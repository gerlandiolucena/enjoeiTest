//
//  ProductCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 19/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation
import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var defaultImage: GLImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var info: UILabel!
    
    func populateCell(product: Product) {
        productNameLabel.text = product.title
        setupInfoLabel(String(format:"R$ %.0f", product.price), size: 36)
        likeButton.setTitle(" \(product.likes ?? 0)", forState: .Normal)
        
        if let url = product.photo.first {
            defaultImage.setURL(url)
        }
    }
    
    func setupInfoLabel(price: String, size: Int?) {
        let priceAttr = NSMutableAttributedString(string:price, attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0xF5595E)])
        let str = NSMutableAttributedString(attributedString: priceAttr)
        
        if let value = size {
            let sizeAttr = NSMutableAttributedString(string:" - tam \(value)", attributes: [NSForegroundColorAttributeName: UIColor.lightGrayColor()])
            str.appendAttributedString(sizeAttr)
        }
        
        info.attributedText = str
    }
}
