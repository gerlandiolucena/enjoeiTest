//
//  ProductList.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 19/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation

class ProductList: NSObject {
    var products = [Product]()
    
    init(dict: [String: AnyObject]) {
        guard let list = dict["products"] as? [AnyObject] else {
            return
        }
        
        for product in list {
            if let prodDict = product as? [String: AnyObject] {
                products.append(Product(dict:prodDict))
            }
        }
    }
}