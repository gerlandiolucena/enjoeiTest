//
//  ListViewController.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 18/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var productList: [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        ProductRequest.productList { (product) in
            //TODO:Inplementar feedback para o usuário de tela carregando
            
            //Somente depois de receber os dados do servidor que a iremos mandar a collection ser carregada
            self.productList = product ?? [Product]()
            
            //Força que o reload seja feito na queue principal pois o download dos dados é feito em uma thread a parte
            dispatch_async(dispatch_get_main_queue(), { 
                self.collectionView.reloadData()
            })
            
        }
        
        let search = UISearchBar()
        search.placeholder = "o que você esta procurando?"
        navigationItem.titleView = search
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let detailView = segue.destinationViewController as? DetailViewController {
            detailView.item = (sender as? Int ?? 0)+1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Retornando zero evita que tenhamos problemas com células em branco caso resultado zero na busca
        return self.productList?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("showDetail", sender: indexPath.item)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("productCell", forIndexPath: indexPath)
        
        //Verificamos qual o tipo da célula instaciada
        if let productCell = cell as? ProductCell, let product = productList?[indexPath.item] {
            //A classe da célula fica responsável por popular os dados da tela
            productCell.populateCell(product)
            return productCell
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake((view.bounds.size.width / 2) - 15, 316)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reusableview = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "cellHeader", forIndexPath: indexPath)
        
        return reusableview
        
    }

}

