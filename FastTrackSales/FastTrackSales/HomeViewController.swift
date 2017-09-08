//
//  HomeViewController.swift
//  FastTrackSales
//
//  Created by Bikash Sukla Das on 03/09/17.
//  Copyright © 2017 Bikash Sukla Das. All rights reserved.
//

import UIKit

/*Note for reference:
 View tag number -->
 HomeViewController : 1
 CustomerProfileViewController : 2
 PromotionsViewController : 3
 CartViewController : 4
 TrackOrdersViewController : 5
 OrderHistoryViewController : 6
 
 topbar height : 84
 bottombar height : 128
 
 working area height : 768 - (84+128) = 556
 
 */

class HomeViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    @IBOutlet var btnBack: UIButton?
    @IBOutlet var btnLogout: UIButton?
    @IBOutlet var btnPromotions: UIButton?
    @IBOutlet var btnCart: UIButton?
    @IBOutlet var btnTrackOrder: UIButton?
    @IBOutlet var btnOrderHistory: UIButton?
    @IBOutlet var ivCustomerProfilePic: UIImageView?
    @IBOutlet var lblHeaderTitle: UILabel?
    
    var isHomeScreen:Bool = true
    let btnLogoutPosActual:CGPoint = CGPoint(x:76, y:30)
    let btnLogoutPosTransform:CGPoint = CGPoint(x:16, y:30)
    let btnSize:CGSize = CGSize(width:42, height:36)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Adding tap gesture into the customer profile pic
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(profilePicTapped))
        ivCustomerProfilePic?.isUserInteractionEnabled = true
        ivCustomerProfilePic?.addGestureRecognizer(tapGestureRecognizer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if isHomeScreen {
            btnBack?.isHidden = true
            btnLogout?.frame = CGRect(x:btnLogoutPosTransform.x,y:btnLogoutPosTransform.y,width:btnSize.width,height:btnSize.height)
        }else{
            btnBack?.isHidden = false
            btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        }
        
    }
    
    func refreshHomeController() {
        if isHomeScreen {
            lblHeaderTitle?.text = "Dashboard"
            btnBack?.isHidden = true
            btnLogout?.frame = CGRect(x:btnLogoutPosTransform.x,y:btnLogoutPosTransform.y,width:btnSize.width,height:btnSize.height)
        }else{
            btnBack?.isHidden = false
            btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Profile setting page navigation
    @objc func profilePicTapped() {
        print("Profile pic tapped")
        
        lblHeaderTitle?.text = "Profile Settings"
        isHomeScreen = false
        //btnBack?.isHidden = false
        //btnLogout?.frame = CGRect(x:btnLogoutPosActual.x,y:btnLogoutPosActual.y,width:btnSize.width,height:btnSize.height)
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let customerProfileObj = storyBoard.instantiateViewController(withIdentifier: "CustomerProfileSBID") as! CustomerProfileViewController
        customerProfileObj.view.frame = CGRect(x:10, y:94, width:1024, height:536)
        self.view.addSubview(customerProfileObj.view)
        
        self.refreshHomeController()
    }
    
    //MARK:- Buttons actions
    
    @IBAction func logoutPressed(_sender: UIButton){
        
        let alertObj = UIAlertController(title: "Alert", message: "You are about to logout from the system. Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        alertObj.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
        alertObj.addAction(UIAlertAction(title:"Yes", style: UIAlertActionStyle.default, handler:{(action:UIAlertAction!) in
            self.navigationController?.popViewController(animated: true) //navigating to login screen
        }))
        
        self.present(alertObj, animated: true, completion: nil)
    }
    
    @IBAction func btnBackPressed(_sender: UIButton){
        

        for viewRef:UIView in self.view.subviews{
            if viewRef.tag == 2{
                viewRef.removeFromSuperview()
                isHomeScreen = true
                self.refreshHomeController()
            }
        }
        
    }
    
    @IBAction func btnPromotionsPressed(_sender: UIButton){
        
    }
    
    @IBAction func btnCartPressed(_sender: UIButton){
        
    }
    
    @IBAction func btnTrackOrdersPressed(_sender: UIButton){
        
    }
    
    @IBAction func btnOrderHistoryPressed(_sender: UIButton){
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
