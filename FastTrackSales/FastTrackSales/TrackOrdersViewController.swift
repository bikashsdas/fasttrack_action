//
//  TrackOrdersViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 06/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit
import QuartzCore

class TrackOrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var tblVwTrackOrders: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tblVwTrackOrders?.delegate = self;
        tblVwTrackOrders?.dataSource = self;
        self.tblVwTrackOrders?.separatorStyle = UITableViewCellSeparatorStyle.none
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackOrdersCellID", for: indexPath) as! TrackOrdersTableViewCell
        cell.selectionStyle = .none
        cell.isUserInteractionEnabled = false
        cell.btnCancelOrder?.layer.cornerRadius = 5
        cell.btnCancelOrder?.layer.masksToBounds = true
        cell.btnViewOrderDetails?.layer.cornerRadius = 5
        cell.btnViewOrderDetails?.layer.masksToBounds = true
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
