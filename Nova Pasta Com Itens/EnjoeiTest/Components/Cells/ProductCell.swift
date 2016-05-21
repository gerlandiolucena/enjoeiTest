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
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    
    func populateCell(product: Product) {
        productNameLabel.text = product.title
        priceLabel.text = String(format:"R$ %.0f", product.price)
        sizeLabel.text = product.size != nil ? "tam \(product.size)" : ""
        likeButton.titleLabel?.text = String(product.likes ?? 0)
        if let url = product.photo.first {
            defaultImage.setURL(url)
        }
    }
}
