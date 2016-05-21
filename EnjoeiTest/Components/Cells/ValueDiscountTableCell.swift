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
            discountLabel.text = String(product.discountPercentage)
            originalPriceLabel.text = String(product.originalPrice)
            likesLabel.text = String(product.likes)
        }
    }
}