//
//  PhotoTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class PhotoTableCell: BaseCell {
    
    @IBOutlet weak var collection: UICollectionView!
    var imageHandler: ImageGalleryHandler = ImageGalleryHandler()
    
    override func populateCell(item: AnyObject){
        imageHandler.collection = collection
        if let itensList = item as? [String] {
            imageHandler.listOfItens = itensList
        }
    }

}
