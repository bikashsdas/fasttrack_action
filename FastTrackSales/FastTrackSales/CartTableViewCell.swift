//
//  CartTableViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/9/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet var lblProductNameText: UILabel?
    @IBOutlet var lblDiscountAmountText: UILabel?
    @IBOutlet var lblTotalAmountText: UILabel?
    @IBOutlet var lblQuantityHeaderText: UILabel?
    @IBOutlet var imgVwProductOrder: UIImageView?
    @IBOutlet var txtFieldQuantity: UITextField?
    @IBOutlet var btnCancelOrDelete: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    @IBAction func btnCancelOrDeletePressed(_sender: UIButton){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }

}
