//
//  ProductDetail.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 19/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation

class ProductDetail: Product {
    
    var related = [Product]()
    
    override init(dict: [String : AnyObject]) {
        super.init(dict: dict)
        if let relatedList = dict["related_products"] as? [AnyObject] {
            for productRelated in relatedList {
                if let productDict = productRelated as? [String:AnyObject] {
                    related.append(Product(dict:productDict))
                }
            }
        }
    }
}