//
//  DetailViewController.swift
//  EnjoeiTest
//
//  Created by Gerlandio Lucena on 18/05/16.
//  Copyright © 2016 gerlandiolucena.net. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var item: Int = 1
    var cellItens: [(identifier: String, item: AnyObject)]?
    var productListHandler: ProductListHandler = ProductListHandler()
    var currentProduct: ProductDetail?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ProductRequest.productDetail(item) { (product) in
            self.currentProduct = product
            dispatch_async(dispatch_get_main_queue(), {self.populatetable()})
        }
        
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.hidden = false
    }
    
    func populatetable() {
        cellItens = [(identifier: String, item: AnyObject)]()
        if let cellPhoto = currentProduct?.photo {
            cellItens?.append(("photoCollectionCell", cellPhoto))
        }
        
        cellItens?.append(("priceCell", currentProduct!))
        
        if let description = currentProduct?.content {
            cellItens?.append(("descriptionCell", description))
        }
        if let size = currentProduct?.size {
            cellItens?.append(("itemDescriptionCell", ["description": "tamanho", "detail": String(size)]))
        }
        if let brand = currentProduct?.brand {
            cellItens?.append(("itemDescriptionCell", ["description": "marca", "detail": brand]))
        }
        if let shipping = currentProduct?.shippingType {
            cellItens?.append(("itemDescriptionCell", ["description": "frete", "detail": shipping]))
        }
        
        cellItens?.append(("bagItensCell", ""))
        cellItens?.append(("separatorCell", ""))
        cellItens?.append(("detailSellerCell", currentProduct!))
        cellItens?.append(("relatedTitleCell", currentProduct!))
        if let itens = currentProduct?.related {
            cellItens?.append(("relatedItensCell", itens))
        }
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellItens?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let defaultText = cellItens![indexPath.item]
        
        let cell = tableView.dequeueReusableCellWithIdentifier(defaultText.identifier, forIndexPath: indexPath)
        
        if let baseCell = cell as? BaseCell {
            baseCell.populateCell(defaultText.item)
            return baseCell
        }
        
        return cell
    }

}