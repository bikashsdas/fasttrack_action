//
//  PromotionsViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 03/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class PromotionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    @IBOutlet var tblVwPromotions: UITableView?
    @IBOutlet var lblPromotionTitleText: UILabel?
    
    var productImages = ["promo_MarlboroClove.png", "promo_MarlboroIce.png", "promo_MarlboroMenthol.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblVwPromotions?.delegate = self;
        tblVwPromotions?.dataSource = self;
        self.tblVwPromotions?.separatorStyle = UITableViewCellSeparatorStyle.none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PromotionsCellID", for: indexPath) as! PromotionsTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        cell.imgVwPromoProduct?.image = UIImage(named: productImages[indexPath.row])
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

