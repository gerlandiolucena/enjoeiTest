//
//  DescriptionTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class DescriptionTableCell: BaseCell {
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func populateCell(item: AnyObject){
        descriptionLabel.text = item as? String ?? ""
    }
}
