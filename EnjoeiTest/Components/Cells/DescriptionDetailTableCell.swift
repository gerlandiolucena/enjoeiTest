//
//  DescriptionDetailTableCell.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class DescriptionDetailTableCell: BaseCell {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    override func populateCell(item: AnyObject){
        if let details = item as? [String: AnyObject] {
            descriptionLabel.text = details["description"] as? String ?? ""
            detailLabel.text = details["detail"] as? String ?? ""
        }
    }

}
