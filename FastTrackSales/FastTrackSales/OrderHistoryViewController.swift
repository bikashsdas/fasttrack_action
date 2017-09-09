//
//  OrderHistoryViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 06/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

class OrderHistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tblVwOrderHistory: UITableView?
    
    var productImages = ["history_LMBlue.png", "history_LMRed.png", "history_MarlboroFuse.png"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tblVwOrderHistory?.delegate = self;
        tblVwOrderHistory?.dataSource = self;
        self.tblVwOrderHistory?.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "OrderHistoryCellID", for: indexPath) as! OrderHistoryTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        cell.btnVwDetailsText?.layer.cornerRadius = 5
        cell.btnVwDetailsText?.layer.masksToBounds = true
        cell.imgVwProduct?.image = UIImage(named: productImages[indexPath.row])

        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
    
}
