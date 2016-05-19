//
//  Product.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 18/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation


class Product: NSObject {
    
    var discountPercentage: Float = 0
    var code: Int = 0
    var originalPrice: Float = 0
    var price: Float = 0
    var title: String = ""
    var content: String = ""
    var likes: Int = 0
    var photo = [String]()
    var condition: String = ""
    var size: Int?
    var shippingType: String = ""
    var brand: String = ""
    var userTitle: String = ""
    var userCity: String = ""
    var userState: String = ""
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        if let discount = dict["discount_percentage"] as? Float {
            self.discountPercentage = discount
        }
        
        if let id = dict["id"] as? Int {
            self.code = id
        }
        
        if let price = dict["original_price"] as? Float {
            self.originalPrice = price
        }
        
        if let value = dict["price"] as? Float {
            self.price = value
        }
        
        if let valueTitle = dict["title"] as? String {
            self.title = valueTitle
        }
        
        if let contentDescription = dict["content"] as? String {
            self.content = contentDescription
        }
        
        if let count = dict["likes_count"] as? Int {
            self.likes = count
        }
        
        if let url = dict["default_photo"] as? String {
            self.photo.append(url)
        }
        
        if let cond = dict["condition"] as? String {
            self.condition = cond
        }
        
        if let size = dict["size"] as? Int {
            self.size = size
        }
        
        if let shipType = dict["shipping_type"] as? String {
            self.shippingType = shipType
        }
        
        if let brand = dict["brand"] as? String {
            self.brand = brand
        }
        
        if let user_title = dict["user_title"] as? String {
            self.userTitle = user_title
        }
        
        if let user_city = dict["user_city"] as? String {
            self.userCity = user_city
        }
        
        if let user_state = dict["user_state"] as? String {
            self.userState = user_state
        }
        
        if let photos = dict["photos"] as? [String] {
            for url in photos {
                self.photo.append(url)
            }
        }
    }
}
