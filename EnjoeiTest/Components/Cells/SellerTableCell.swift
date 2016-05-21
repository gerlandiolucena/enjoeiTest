//
//  SellerTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class SellerTableCell: BaseCell {
    @IBOutlet weak var imageSeller: UIImageView!
    @IBOutlet weak var sellerNameLabel: UILabel!
    @IBOutlet weak var cityStateLabel: UILabel!
    
    override func populateCell(item: AnyObject){
        if let product = item as? ProductDetail {
            sellerNameLabel.text = product
        }
    }
}
