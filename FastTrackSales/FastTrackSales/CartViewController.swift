//
//  CartViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 03/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit
import QuartzCore

class CartViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    
    
    @IBOutlet var tblVwCart: UITableView?
    @IBOutlet var lblTotalSubText: UILabel?
    @IBOutlet var lblTotalValueText: UILabel?
    @IBOutlet var btnCancelCart: UIButton?
    @IBOutlet var btnOrderNow: UIButton?
    
    var productImages = ["history_LMRed.png","history_LMBlue.png",]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblVwCart?.delegate = self;
        tblVwCart?.dataSource = self;
        self.tblVwCart?.separatorStyle = UITableViewCellSeparatorStyle.none
        btnCancelCart?.layer.cornerRadius = 5
        btnCancelCart?.layer.masksToBounds = true
        btnOrderNow?.layer.cornerRadius = 5
        btnOrderNow?.layer.masksToBounds = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCellID", for: indexPath) as! CartTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        cell.btnCancelOrDelete?.layer.cornerRadius = 5
        cell.btnCancelOrDelete?.layer.masksToBounds = true
        cell.imgVwProductOrder?.image = UIImage(named: productImages[indexPath.row])
        
        return cell
    }
    
    @IBAction func btnCancelOrderFromCartPressed(_sender: UIButton){
        
    }
    
    @IBAction func btnOrderNowPressed(_sender: UIButton){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }


}

