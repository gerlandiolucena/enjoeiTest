//
//  ProductListHandler.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import Foundation
import UIKit

class ProductListHandler: BaseCollectionHandler {
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("productCell", forIndexPath: indexPath)
        
        //Verificamos qual o tipo da célula instaciada
        if let productCell = cell as? ProductCell, let product = listOfItens?[indexPath.item] as? Product{
            //A classe da célula fica responsável por popular os dados da tela
            productCell.populateCell(product)
            return productCell
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.width / 2) - 15, 316)
    }
}