//
//  ProductItemCollectionViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/9/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class ProductItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var lblItemNameText: UILabel?
    @IBOutlet var lblAvailableQuantityText: UILabel?
    @IBOutlet var imgVwPoductItem: UIImageView?
    @IBOutlet var txtFeildReqQuantity: UITextField?
    @IBOutlet var btnAddToCart: UIButton?
    
    
    @IBAction func btnAddToCartPressed(_sender: UIButton){
        
    }
}
