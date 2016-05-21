//
//  ListProductTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class ListProductTableCell: BaseCell {

    @IBOutlet weak var collection: UICollectionView!
    var productHandler: ProductListHandler = ProductListHandler()
    
    override func populateCell(item: AnyObject){
        productHandler.collection = collection
        if let itensList = item as? [Product] {
            productHandler.listOfItens = itensList
        }
    }
}
