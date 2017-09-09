//
//  PromotionsTableViewCell.swift
//  FastTrackSales
//
//  Created by arnab on 9/9/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class PromotionsTableViewCell: UITableViewCell {

    
    @IBOutlet var lblProductNameText: UILabel?
    @IBOutlet var lblProductNameSubText: UILabel?
    @IBOutlet var lblDateText: UILabel?
    @IBOutlet var txtVwPromoBodyText: UITextView?
    @IBOutlet var btnPromoNext: UIButton?
    @IBOutlet var imgVwPromoProduct: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    @IBAction func btnPromoNextPressed(_sender: UIButton){
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
