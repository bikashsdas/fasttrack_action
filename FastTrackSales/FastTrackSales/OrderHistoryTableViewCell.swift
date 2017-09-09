//
//  OrderHistoryTableViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/9/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class OrderHistoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet var lblProductNameText: UILabel?
    @IBOutlet var lblOrderIdText: UILabel?
    @IBOutlet var lblQuantityText: UILabel?
    @IBOutlet var lblDeliveryStatusText: UILabel?
    @IBOutlet var lblDeliveryDateText: UILabel?
    @IBOutlet var btnVwDetailsText: UIButton?
    @IBOutlet var imgVwProduct: UIImageView?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func btnViewDetailsPressed(_sender: UIButton){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
