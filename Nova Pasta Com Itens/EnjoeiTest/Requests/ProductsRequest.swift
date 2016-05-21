//
//  ProductsRequest.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 19/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation

struct ProductRequest {
    
    static let defaultURL = "https://gist.githubusercontent.com/caironoleto/9cd18d9642a7d5e8eef0/raw/dbe726570f063e2be2b353fd35d48ff9f9180b52"
    
    static let productListURL = "\(defaultURL)/_products.json"
    static let productDetailURL = "\(defaultURL)/product_@@.json"
    
    static func productList(completion: ((product: [Product]?) -> Void)) {
        
        if let url = NSURL(string:productListURL) {
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) in
                do{
                    guard let data = data else {
                        completion(product: nil)
                        return
                    }
                    if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String:AnyObject] {
                        let result = ProductList(dict:dict)
                        completion(product: result.products)
                    }
                    
                } catch let jsonError as NSError {
                    NSLog("Ocorreu um erro durante a conversão dos dados, verifique o endpoint informado.Erro: \(jsonError.localizedDescription)")
                    completion(product: nil)
                }
            }).resume()
        }
    }
    
    static func productDetail(id: Int, completion: ((product: ProductDetail?) -> Void)) {
        
        if let url = NSURL(string:productDetailURL.stringByReplacingOccurrencesOfString("@@", withString: String(id))) {
            NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: { (data, response, error) in
                do{
                    guard let data = data else {
                        completion(product: nil)
                        return
                    }
                    if let dict = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions()) as? [String:AnyObject] {
                        let result = ProductDetail(dict:dict)
                        completion(product: result)
                    }
                    
                } catch let jsonError as NSError {
                    NSLog("Ocorreu um erro durante a conversão dos dados, verifique o endpoint informado.Erro: \(jsonError.localizedDescription)")
                    completion(product: nil)
                }
            }).resume()
        }
    }

}