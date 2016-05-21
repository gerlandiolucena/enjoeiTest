//
//  ValueDiscountTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class ValueDiscountTableCell: BaseCell {
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var likesLabel: UILabel!
    
    override func populateCell(item: AnyObject){
        if let product = item as? ProductDetail {
            discountLabel.hidden = true
            if product.discountPercentage > 0 {
                discountLabel.text = "\(String(product.discountPercentage)) OFF"
                discountLabel.hidden = false
            }
            if product.originalPrice != 0 {
                setupInfoLabel(String(product.originalPrice), discount: "\(product.price)")
            } else {
                setupInfoLabel(String(product.price), discount: nil)
            }
            likesLabel.text = String(product.likes)
        }
    }
    
    func setupInfoLabel(price: String, discount: String?) {
        let priceAttr = NSMutableAttributedString(string:"R$ \(price)", attributes: [NSForegroundColorAttributeName: UIColor(netHex: 0xF5595E), NSFontAttributeName: UIFont(name: "ProximaNova-SemiBold", size: 20)!])
        let str = NSMutableAttributedString(attributedString: priceAttr)
        
        if let value = discount {
            let sizeAttr = NSMutableAttributedString(string:" R$ \(value)", attributes: [NSForegroundColorAttributeName: UIColor.lightGrayColor(), NSFontAttributeName: UIFont(name: "ProximaNova-Regular", size: 20)!])
            str.appendAttributedString(sizeAttr)
        }
        
        originalPriceLabel.attributedText = str
    }
}