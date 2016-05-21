//
//  PhotoCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    @IBOutlet weak var defaultImage: GLImageView!
    
    func populateCell(photo: String) {
        defaultImage.setURL(photo)
    }
}
