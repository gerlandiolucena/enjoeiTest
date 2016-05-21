//
//  BaseCollectionHandler.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 20/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class BaseCollectionHandler:  NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var listOfItens: [AnyObject]? {
        didSet {
            dispatch_async(dispatch_get_main_queue()) {self.collection?.reloadData()}
        }
    }
    var view: UIView?
    
    override init() {
        super.init()
    }

    var collection: UICollectionView? {
        didSet{
            collection?.delegate = self
            collection?.dataSource = self
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Retornando zero evita que tenhamos problemas com células em branco caso resultado zero na busca
        return self.listOfItens?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("baseCell", forIndexPath: indexPath)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((UIScreen.mainScreen().bounds.width / 2) - 15, 316)
    }
    
}