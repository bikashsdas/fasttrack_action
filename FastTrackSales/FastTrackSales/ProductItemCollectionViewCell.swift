//
//  ProductItemCollectionViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/9/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

protocol ProductItemCollectionViewCellDelegate:class{
    
    func addToCartSelected(objProductItemCollectionViewCell:ProductItemCollectionViewCell)
}



class ProductItemCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var lblItemNameText: UILabel?
    @IBOutlet var lblAvailableQuantityText: UILabel?
    @IBOutlet var imgVwPoductItem: UIImageView?
    @IBOutlet var txtFeildReqQuantity: UITextField?
    @IBOutlet var btnAddToCart: UIButton?
    
    var delegateObj:ProductItemCollectionViewCellDelegate?
    
    @IBAction func btnAddToCartPressed(sender: UIButton){
        delegateObj?.addToCartSelected(objProductItemCollectionViewCell: self)
    }
}
