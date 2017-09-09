//
//  TrackOrdersTableViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/8/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class TrackOrdersTableViewCell: UITableViewCell {
    
    @IBOutlet var lblTrackNodeOrderStatusText: UILabel?
    @IBOutlet var lblTrackNodeConfirmationStatusText: UILabel?
    @IBOutlet var lblTrackNodePackedStatusStatusText: UILabel?
    @IBOutlet var lblTrackNodeDispatchStatusText: UILabel?
    @IBOutlet var lblOrderIdText: UILabel?
    @IBOutlet var lblTrackingNumberText: UILabel?
    @IBOutlet var lblOrderDateText: UILabel?
    @IBOutlet var lblOrderSummaryText: UILabel?
    @IBOutlet var btnCancelOrder: UIButton?
    @IBOutlet var btnViewOrderDetails: UIButton?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func btnCancelOrdersPressed(_sender: UIButton){
        
    }
    @IBAction func btnViewOrderDetailsPressed(_sender: UIButton){
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
